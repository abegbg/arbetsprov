class OrdersController < ApplicationController
  include CartrowsHelper
  include OrderrowsHelper
  include CartsHelper


  before_action :require_signin, only: [:index, :update, :destroy] #BAPP Vill ha med :show
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.includes(orderrows: [:product]).where(id: params[:id]).first
  end

  def new
    @order = Order.new
    get_cart_from_cookie
    get_cartrows_from_cart(@cart)
  end


  def edit
  end

  def create
    #Check so that number of products in the cart is available. Should be done in the model.BAPP
    @order = Order.new(order_params)

    #Save Cartrows to Orderrows.
    get_cart_from_cookie
    get_cartrows_from_cart(@cart)
    cart_to_orderrows(@cartrows, @order)

    respond_to do |format|
      if valid_order?(@order)
        if @order.save
          @show_order = @order
          #Lower quantity on product here? 
          #lower_product_quantity(@order) #Should be done in the product controller.
          @cartrows.each do |cartrow|
            cartrow.product.lower_quantity(cartrow.quantity)
          end
          empty_cart
          OrderMailer.send_order_email(@order).deliver
          if current_user
            format.html { redirect_to @order, notice: 'Order skapad.' }
          else
            # Måste komma vidare utan att gå till ordern. Nu kan man skriva vilket ordernummer som helst.
            # Inte bästa sättet att lösa det känns det som.
            # FÅr ingen yield eller resten när jag gör så här.
            format.html { render @order, notice: 'Order skapad.' }  
          end
        else
          format.html { render :new }
        end
      else
        #Order was not valid.
        flash[:alert] = "Varor i varukorgen finns inte i lager."
        format.html { render :new }
      end
    end
  end



  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order uppdaterad.' }
      else
        format.html { render :edit }
      end
    end
  end


  #Vill nog snarare spara den och lägga undan.
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order borttagen.' }
    end
  end


  def sendorder
    @order = Order.find(params[:id])
    #Man skulle ju vilja skicka in andra värden här. Detta är lite smått meningslöst.
    #Hinner jag så kikar jag på det. BAPP
    @order.orderrows.each do |orderrow|
      orderrow.sent_quantity = orderrow.quantity
    end
    @order.status = "Skickad"

    if @order.save
      redirect_to @order, notice: "Ordern har markerats som skickad!"
    else
      render :new
    end

  end


private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :adress, :co, :zipcode, :city, :country, :d_adress, :d_co, :d_city, :d_country, :d_zipcode, :email, :mobile, :status)
  end

  #Ganska säker på att detta kan göras så mycket bättre.
  def valid_order?(order)
    flag = true
    order.orderrows.each do |orderrow|
      if orderrow.quantity > Product.find(orderrow.product_id).stock
        flag = false
      end
    end
    flag
  end



end

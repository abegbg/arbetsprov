class OrdersController < ApplicationController
  include CartrowsHelper
  include OrderrowsHelper

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orderrows = @order.orderrows
  
  end

  def new
    @order = Order.new
    get_cart_from_cookie
    get_cartrows_from_cart(@cart)
  end


  def edit
  end

  def create
    @order = Order.new(order_params)

    #Spara ner Cartrows till Orderrows.
    get_cart_from_cookie
    get_cartrows_from_cart(@cart)
    cart_to_orderrows(@cartrows, @order)

    respond_to do |format|
      if @order.save
        ##EMPTY CART BAPP
        format.html { redirect_to @order, notice: 'Order skapad.' }
      else
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

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :adress, :co, :zipcode, :city, :country, :d_adress, :d_co, :d_city, :d_country, :d_zipcode, :email, :mobile, :status)
    end
end

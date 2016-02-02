class CartrowsController < ApplicationController
	before_action :set_product, only: [:new, :create]

	def index
		if cookies[:cart] 
			@cart_id = cookies[:cart]
			@cart = Cart.find_by id: @cart_id
			@cartrows = Cartrow.where(cart_id: @cart_id)
			#@cartrows = Cartrow.all
		else
			@cartrows = Cartrow.all
		end

	end

	def new
		@cartrow = @product.cartrows.new
	end

	def create
		if cookies[:cart] 
			cart_id = cookies[:cart]
			@cart = Cart.find_by id: cart_id
		else
			@cart = Cart.new
			@cart.save

			cookies[:cart] = @cart.id
		end

		@cartrow = @product.cartrows.new(cartrow_params)
		@cartrow.cart = @cart

		respond_to do |format|
			if @cartrow.save
				format.html { redirect_to @product, notice: 'Produkten är tillagd i varukorgen.' }
			  format.json { render json: @product }
			else
				format.html { render action: 'edit' }
				format.json { render json: @cartrow.errors.full_messages, status: :unprocessable_entity }
			end
		end


    # if @review.save
    #   redirect_to movie_reviews_path(@movie),
    #     notice: "Thanks for your review!"
    # else
    #   render :new
    # end

	end

private

  def cartrow_params
    params.require(:cartrow).permit(:quantity)
  end

  def set_product
		@product = Product.find(params[:product_id])  	  	
  end

end

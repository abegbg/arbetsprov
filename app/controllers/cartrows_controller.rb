class CartrowsController < ApplicationController
	include CartrowsHelper
	before_action :set_product, only: [:new, :create]

	def index
	#	if cookies[:cart]
			get_cart_from_cookie
#			@cart_id = cookies[:cart]
#			@cart = Cart.find_by id: @cart_id
			get_cartrows_from_cart(@cart)
	#	end
	end

	def new
		@cartrow = @product.cartrows.new
	end

	def create
		get_cart_from_cookie

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
	end



private

  def cartrow_params
    params.require(:cartrow).permit(:quantity)
  end

  def set_product
		@product = Product.find(params[:product_id])  	  	
  end

end

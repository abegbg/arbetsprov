class CartrowsController < ApplicationController
	include CartrowsHelper
	include CartsHelper

	before_action :set_product, only: [:new, :create]

	def index
		get_cart_from_cookie
		get_cartrows_from_cart(@cart)
	end


	def create
		get_cart_from_cookie
		@cartrow = @cart.cartrows.new(cartrow_params)
		@cartrow.product_id = @product.id

		if is_number?(params[:cartrow][:quantity])
			#Check if product already exists in cart.
			@cart.cartrows.each do |cartrow|
				if (cartrow.product_id == @cartrow.product_id && cartrow.id != @cartrow.id )
					cartrow.quantity = cartrow.quantity.to_i + @cartrow.quantity.to_i
					@cartrow = cartrow
					puts("----------")
					puts(@cartrow.quantity)
					break #Not sure if it is good practice to use break.
				end
			end
		end

		respond_to do |format|
			if @cartrow.save
#				format.html { redirect_to @product, notice: 'Produkten är tillagd i varukorgen.' }
			  format.json { render json: @product }
			else
#				format.html { render action: 'edit' }
				format.json { render json: @cartrow.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end



private

	def cartrow_params
    params.require(:cartrow).permit(:quantity)
  end

  def set_product
  	cartrow = params[:cartrow]
		@product = Product.find(cartrow.fetch(:product_id))
  end

end

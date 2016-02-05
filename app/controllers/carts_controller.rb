class CartsController < ApplicationController
	include CartrowsHelper

	def new
		@cart = Cart.new
	end


	def show
		get_cart_from_cookie #BAPP KAN JAG LÄGGA DE HÄR I MODELLEN INTE I EN HELPER?
		@cartrows = get_cartrows_from_cart(@cart)
	end

	def destroy
		#Borde man kanske lägga i en egen metod i modellen. BAPP
		if cookies[:cart] 
			cart_id = cookies[:cart]
			@cart = Cart.find_by id: cart_id
			@cart.destroy
			cookies.delete :cart
		else
			##Do nothing.
		end
		redirect_to cart_url , notice: 'Varukorgen tömd.'
	end


end

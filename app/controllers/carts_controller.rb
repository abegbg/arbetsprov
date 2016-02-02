class CartsController < ApplicationController
	include CartrowsHelper

	def new
		@cart = Cart.new
	end

	def destroy
		if cookies[:cart] 
			cart_id = cookies[:cart]
			@cart = Cart.find_by id: cart_id
			#Borde verkligen koppla ihop Cart och cartrows
			remove_cartrows(cart_id)
			@cart.destroy
			cookies.delete :cart
		else
			##Do nothing.
		end
		redirect_to cartrows_url , notice: 'Varukorgen tömd.'
	end


end

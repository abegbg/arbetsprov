module CartsHelper

	def get_cart_from_cookie
		if cookies[:cart] 
			cart_id = cookies[:cart]
			@cart = Cart.find_by id: cart_id
		else
			@cart = Cart.new
			@cart.save
			cookies[:cart] = @cart.id
		end
		@cart_id = cookies[:cart]
	end


end

module CartrowsHelper

	def remove_cartrows(cart_id)
		Cartrow.where(:cart_id => cart_id).destroy_all
	end

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

	def get_cartrows_from_cart(cart)
		@cartrows = Cartrow.where(cart_id: cart.id)
	end

end

module CartrowsHelper

	def remove_cartrows(cart_id)
		Cartrow.where(:cart_id => cart_id).destroy_all
	end

	def get_cartrows_from_cart(cart)
		@cartrows = Cartrow.where(cart_id: cart.id)
	end

end

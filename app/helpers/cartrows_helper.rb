module CartrowsHelper

	def remove_cartrows(cart_id)
		Cartrow.where(:cart_id => cart_id).destroy_all
	end

end

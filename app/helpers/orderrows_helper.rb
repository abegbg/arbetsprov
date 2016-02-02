module OrderrowsHelper

	def cart_to_orderrows(cartrows, order)
		cartrows.each do |cartrow|
			orderrow = order.orderrows.new
			orderrow.product_id = cartrow.product_id
			orderrow.quantity = cartrow.quantity
		end
	end


	def empty_cart
		cart_id = cookies[:cart]
		@cart = Cart.find_by id: cart_id
		remove_cartrows(cart_id)
		@cart.destroy
		cookies.delete :cart
	end



end

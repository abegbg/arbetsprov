module OrderrowsHelper

	def cart_to_orderrows(cartrows, order)
		cartrows.each do |cartrow|
			orderrow = order.orderrows.new
			orderrow.product_id = cartrow.product_id
			orderrow.quantity = cartrow.quantity
		end
		
	end
end

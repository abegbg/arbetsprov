class OrderrowsController < ApplicationController

	def index
		@order = Order.find(params[:order_id])
		@orderrows = @order.orderrows
	end

end

module ApplicationHelper

	def number_of_new_orders
		Order.where(status: 'Ny').size
	end
end

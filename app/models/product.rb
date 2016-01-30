class Product < ActiveRecord::Base



	def stock_low?
		stock < 10
	end	

	def no_stock?
		stock == 0
	end

end

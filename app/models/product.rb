class Product < ActiveRecord::Base
	has_many :orderrows
	has_many :cartrows

	validates :name, presence: true	
	validates :price, numericality: { greater_than_or_equal_to: 0 }
	validates :description, length: { minimum: 25 }
	validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def stock_low?
		stock < 10
	end	

	def no_stock?
		stock == 0
	end

	def lower_quantity(quantity)
		self.stock = self.stock - quantity
		self.save
	end


end

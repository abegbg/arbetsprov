class Cart < ActiveRecord::Base
	has_many :cartrows, dependent: :destroy


	def sum
		sum = 0
		cartrows.each do |cartrow|
			sum = sum + (cartrow.product.price * cartrow.quantity)
		end
		return sum
	end

end

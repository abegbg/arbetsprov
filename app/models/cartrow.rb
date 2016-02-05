class Cartrow < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # def merge_rows(new_row, old_row)
 	# 		cart.cartrows.each do |cartrow|
		# 	if cartrow.product_id == @cartrow.product_id
		# 		cartrow.quantity = cartrow.quantity + @cartrow.quantity
		# 		@cartrow = cartrow
		# 		break #Not sure if it is good practice to use break.
		# 	end
		# end

  # end


end

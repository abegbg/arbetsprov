class Order < ActiveRecord::Base
	has_many :orderrows

	validates :name, :adress, :zipcode, :city, :country, :email, presence:true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  STATUSES = %w(Ny Pausad Bearbetas Redo Packad Skickad)

  validates :status, inclusion: { in: STATUSES }

  def sent?
  	status == 'Skickad'
  end

  def sum
		sum = 0
		orderrows.each do |orderrow|
			sum = sum + (orderrow.product.price * orderrow.quantity)
		end
		return sum

  end
end

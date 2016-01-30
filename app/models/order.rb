class Order < ActiveRecord::Base

	validates :name, :adress, :zipcode, :city, :country, :email, presence:true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end

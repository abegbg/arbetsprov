class Order < ActiveRecord::Base
	has_many :orderrows

	validates :name, :adress, :zipcode, :city, :country, :email, presence:true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  STATUSES = %w(Ny Pausad Redo Skickad)

  validates :status, inclusion: { in: STATUSES }



end

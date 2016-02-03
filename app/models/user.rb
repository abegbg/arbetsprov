class User < ActiveRecord::Base
  has_secure_password

	validates :name, presence: true  
	validates :email, presence: true,
								 format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
								 uniqueness: { case_sensitive: false }


	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
	end

	def superuser?
		superuser > 0
	end

end

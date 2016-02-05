class Cart < ActiveRecord::Base
	has_many :cartrows, dependent: :destroy


end

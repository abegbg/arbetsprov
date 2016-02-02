class CartsController < ApplicationController

	def new
		@cart = Cart.new
	end

end

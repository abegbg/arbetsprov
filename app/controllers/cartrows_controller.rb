class CartrowsController < ApplicationController
	include CartrowsHelper
	before_action :set_product, only: [:new, :create]

	def index
	#	if cookies[:cart] BAPP
			get_cart_from_cookie
#			@cart_id = cookies[:cart]
#			@cart = Cart.find_by id: @cart_id
			get_cartrows_from_cart(@cart)
	#	end
	end

	#Behövs denna? Tror inte det. BAPP 
	# def new
	# 	@cartrow = @product.cartrows.new
	# end

	def create
		puts("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------") 

		get_cart_from_cookie
		@cartrow = @cart.cartrows.new(cartrow_params)
		@cartrow.product_id = @product.id
#		@cartrow.cart = @cart

		#Skapa metod som heter merge eller något BAPP
#		merge_rows(@cart_row, @cart)
		#Check if product already exists in cart.
		# @cart.cartrows.each do |cartrow|
		# 	if cartrow.product_id == @cartrow.product_id
		# 		cartrow.quantity = cartrow.quantity + @cartrow.quantity
		# 		@cartrow = cartrow
		# 		break #Not sure if it is good practice to use break.
		# 	end
		# end


		respond_to do |format|
			if @cartrow.save
				format.html { redirect_to @product, notice: 'Produkten är tillagd i varukorgen.' }
			  format.json { render json: @product }
			else
				format.html { render action: 'edit' }
				format.json { render json: @cartrow.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end



private

  def cartrow_params
    params.require(:cartrow).permit(:quantity)
  end

  def set_product
  	cartrow = params[:cartrow]
		@product = Product.find(cartrow.fetch(:product_id))
  end

end

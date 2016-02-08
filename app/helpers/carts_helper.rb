module CartsHelper

	def get_cart_from_cookie
		if cookies[:cart] 
#			cart_id = cookies[:cart]
#    @order = Order.includes(orderrows: [:product]).where(id: params[:id]).first


			@cart = Cart.includes(cartrows: [:product]).where(id: cookies[:cart]).first
		else
			@cart = Cart.new
			@cart.save
			cookies[:cart] = @cart.id
		end
		@cart_id = cookies[:cart]
	end


end

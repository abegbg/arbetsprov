class OrderrowsController < ApplicationController

	# def index
	# 	fail
	# 	@order = Order.find(params[:order_id])
	# 	@orderrows = @order.orderrows
	# end


	def create
		
	end


	def update
		@orderrow = Orderrow.includes(:product).where(id: params[:id]).first #Känns inte som om den ger mig något egentligen. Kan bara ha en product per rad.
		@product = @orderrow.product 
		@order = @orderrow.order

		if is_number?(params[:orderrow][:quantity])
			old_quantity = @orderrow.quantity.to_i
			new_quantity = params[:orderrow][:quantity].to_i
			difference = old_quantity - new_quantity

			@orderrow.quantity = new_quantity
			@product.stock = (@product.stock + difference).to_i
		end
		#Man skulle kunna ha en koll på om den sätts till noll att man tar bort raden,
		#men man kan diskutera om man inte skall visa borttagna rader för historikens skull.
		#Hart valt att låta raden vara.
		
		#Ändra antalet i orderraden.
		respond_to do |format|
			if is_number?(params[:orderrow][:quantity]) && @product.save && @orderrow.save 
#				format.html { redirect_to @order, notice: 'Orderraden är uppdaterad.' }
			  format.json { render json: @order, notice: 'Orderraden är uppdaterad.' }
			else
#				format.html { render action: 'index' }
				format.json { render json: @orderrow.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end



	#Fick den inte att gå till den här istället för update
	def update_quantity
	end



private

	def is_number? string
		true if Float(string) rescue false
	end

	def orderrow_params
		params.require(:orderrow).
										permit(:quantity, :product)

	end
end

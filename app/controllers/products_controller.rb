class ProductsController < ApplicationController

	def index
		@products = Product.all
	end


	def show
		@product = Product.find(params[:id])
	
		#Skapa jag skapa en egen för cartrow och köra en render på den?
#		@cartrow = @product.cartrows.new
		@cartrow = Cartrow.new

		#Har jag ingen cart vill jag skapa en, annars läsa in den.
		if cookies[:cart] 
			cart_id = cookies[:cart]
			@cart = Cart.find_by id: cart_id
		else
			@cart = Cart.new
			@cart.save
			cookies[:cart] = @cart.id
		end
	end


	def edit
		@product = Product.find(params[:id])
	end


	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			format.html { redirect_to @product, notice: 'Produkten är uppdaterad.' }
		  format.json { render json: @product }
		else
			format.html { render action: 'edit' }
			format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
		end

		# 	redirect_to @product, notice: "Produkten är uppdaterad"
		# else
		# 	render :edit
		# end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		respond_to do |format|
		    if @product.save
		      format.html { redirect_to @product, notice: 'Produkten skapad.' }
		      # format.js   {}
#		      format.json { render json: @product, status: :created, location: @product }
 		      format.json { render json: @product }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
		    end
		  end

		# if @product.save
		# 	redirect_to @product, notice:
		# 	 "Produkten skapad"
		# else
		# 	render :new
		# end


	end

	def destroy
		#Man borde inte kunna ta bort en produkt om den finns i en order.
		#Borde ha en flagga som inte visar produkten i stället.
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_url

	end


private

	def product_params
		params.require(:product).
										permit(:name, :description, :price, :stock, :image)

	end



end

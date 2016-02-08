class ProductsController < ApplicationController
	include CartsHelper
	before_action :require_signin, except: [:index, :show]

	def index
		@products = Product.all
	end


	def show
		@product = Product.find(params[:id])
		@cartrow = Cartrow.new
		get_cart_from_cookie
	end


	def edit
		@product = Product.find(params[:id])
	end


	def update
		@product = Product.find(params[:id])
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to @product, notice: 'Produkten är uppdaterad.' }
			  format.json { render json: @product, notice: 'Produkten är uppdaterad.' }
			else
				format.html { render action: 'edit' }
				format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end


	def new
		@product = Product.new
	end


	def create
		@product = Product.new(product_params)

		respond_to do |format|
	    if @product.save
	      format.html { redirect_to @product, notice: 'Produkten skapad.' }
	      format.json { render json: @product, notice: 'Produkten är skapad.' }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
	    end
	  end
	end

	def destroy
		#Man borde inte kunna ta bort en produkt om den finns i en order.
		#Borde ha en flagga som inte visar produkten i stället.
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_url, notice: "Produkten borttagen."
	end


private

	def product_params
		params.require(:product).
										permit(:name, :description, :price, :stock, :image)

	end



end

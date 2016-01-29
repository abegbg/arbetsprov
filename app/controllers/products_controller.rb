class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to @product
	end

	def new
		@product = Product.new
	end

	def create

		@product = Product.new(product_params)
		@product.save
		redirect_to @product
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

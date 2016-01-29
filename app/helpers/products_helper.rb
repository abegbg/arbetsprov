module ProductsHelper

	def format_stock(product)
		if product.no_stock?
			content_tag(:p, "Slut i lager!", class: "low_stock")
		elsif product.stock_low?
			content_tag(:p, product.stock.to_s + " st i lager", class: "low_stock")
		else
			content_tag(:p, product.stock.to_s + " st i lager", class: "normal_stock")
		end
	end

end

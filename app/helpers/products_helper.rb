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

	def image_for_thumb(product)
		if product.image.blank?
			image_tag "products/thumbs/placeholder.png"
		else
			image_tag("products/thumbs/" + product.image, size: "100x100", alt: product.name)
		end
	end

	def image_for_full(product)
		if product.image.blank?
			image_tag("products/fullsize/placeholder.png", class: "col-xs-6")
		else
			image_tag("products/fullsize/" + product.image, size: "500x500", alt: product.name, class: "col-xs-6")
		end
	end



end

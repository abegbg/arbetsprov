module ProductsHelper

	def format_stock(product)
		if product.no_stock?
			content_tag(:span, "Slut i lager!", class: "low_stock")
		elsif product.stock_low?
			content_tag(:span, product.stock.to_s + " st i lager", class: "low_stock")
		else
			content_tag(:span, product.stock.to_s + " st i lager", class: "normal_stock")
		end
	end

	def image_for_thumb(product, size_in)
		if product.image.blank?
			image_tag("products/thumbs/placeholder.png", size: size_in.to_s)
		else
			image_tag("products/thumbs/" + product.image, size: size_in.to_s, alt: product.name)
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

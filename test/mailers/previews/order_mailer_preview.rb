# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

	def send_order_email_preview
		OrderMailer.send_order_email(Order.first)
	end
end

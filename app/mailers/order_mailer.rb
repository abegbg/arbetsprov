class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_order_email(order)
  	puts('-----------------------')

  	@order = order
    mail( :to => @order.email,
    :subject => 'Tack för din beställning',
		:content_type => "text/html"
    )
  end

#Test
#http://localhost:3000/rails/mailers/order_mailer/send_order_email_preview
#order_mailer_preview.rb

#Man kanske skulle testa att använda sendgrid om jag skall få ett mail på riktigt.
#https://sendgrid.com/docs/Integrate/Frameworks/rubyonrails.html


end

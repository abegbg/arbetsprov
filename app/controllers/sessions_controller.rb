class SessionsController < ApplicationController

	def new
		
	end


	def create
		if user = User.authenticate(params[:email], params[:password])
			# session
			session[:user_id] = user.id
			flash[:notice] = "#{user.name} är inloggad!"
			redirect_to user
		else
			flash.now[:alert] = "Felaktiga inloggningsuppgifter!"
			render :new
		end
	end


end

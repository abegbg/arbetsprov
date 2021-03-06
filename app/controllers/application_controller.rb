class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



private

	def require_signin
		unless current_user
			session[:intended_url] = request.url
			redirect_to new_session_url, alert: "Vänligen logga in."
		end
	end


	def is_number? string
		true if Float(string) rescue false
	end


	def current_user #kan inte ligga i application_helper om man skall komma åt den från controllers.
		#Bör nog inte ladda den varje gång. Blir ett databasanrop varje gång jag kontrollerar current_user.
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user #Så att man kommer åt den från controllers och views.

end

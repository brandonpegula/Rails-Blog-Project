class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			flash[:message] = 'Sucessfully logged in!'
			redirect_to '/users'
		else 
			flash[:message] = 'Please try again'
			redirect_to '/login'
		end
	end

	


	def destroy
		session[:user_id] = nil
		flash[:message] = 'Logged out'
		redirect_to '/'
	end

end


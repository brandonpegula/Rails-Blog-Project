class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		flash[:message] = 'Profile Created!'
  		redirect_to '/users'
  	else
  		flash[:message] = 'Please try again'
  		redirect_to '/users/new'
  	end
  end


  def new
  	@user = User.new
  end

  def show
  		@user = User.find(params[:id])
  		@comments = Comment.where(user_id: params[:id]) 
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
	user.update(user_params)
		redirect_to "/users/#{user.id}"
  end

  def destroy
  	user = User.find(params[:id])
	user.destroy
	session[:user_id] = nil
	flash[:message] = "User deleted"
	redirect_to '/users'
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :fname, :lname, :password, :password_confirmation)
  
  end
end

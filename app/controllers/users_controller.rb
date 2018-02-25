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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :fname, :lname, :password, :password_confirmation)
  
  end
end

class UsersController < ApplicationController
  

  def create
  end

  def new
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
  	params.require(:user).permit(:username, :email, :fname, :lname, :password)
  end
end

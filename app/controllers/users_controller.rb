class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :password)
  end
end

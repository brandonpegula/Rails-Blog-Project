class CommentsController < ApplicationController
	
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
  	def comment_params
    params.require(:comment).permit(:message, :post_id, :user_id)
  end
end
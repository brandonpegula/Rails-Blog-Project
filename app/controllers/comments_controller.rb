class CommentsController < ApplicationController
	before_action :find_post
	before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
	before_action :comment_owner, only: [:destroy, :edit, :update]

	def create
  	@comment = @post.comments.create(params[:comment].permit(:message))
  	@comment.user_id = current_user.id
  	@comment.save

  	if @comment.save
    	redirect_to post_path(@post)

  	else
    	render "new"
  end
end

  	def new
  	end

  	def show
  	end

  	def edit

  	end

  	def update
  		if @comment.update(params[:comment].permit(:message))
  			redirect_to post_path(@post)
  			flash[:message] = "Post Updated"
  		else
  			render "edit"
  		end
  	end

  	def destroy
    	@comment.destroy
    	redirect_to post_path(@post)
    	flash[:message] = "Post Deleted"
  	
  	end

  	private
  
  	def find_post
    @post = Post.find(params[:post_id])
  	end

  	def find_comment
  		@comment = @post.comments.find(params[:id])
  	end

  	def comment_owner
  		unless current_user.id == @comment.user_id
  			flash[:message] = "You can't access this."
  			redirect_to @post
  		end
  	end
end

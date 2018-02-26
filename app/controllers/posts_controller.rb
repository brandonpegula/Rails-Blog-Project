class PostsController < ApplicationController
  
  before_action :authenticate_with_http_digest, except: [:index, :show]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      flash[:message] = 'Your post was created successfully'
      redirect_to "/posts"
    else
      flash[:message] = 'try again'
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.assign_attributes(post_params)
      if post.save
      flash[:message] = "Sucessfully Updated"
      redirect_to "/posts/#{post.id}/"
      else 
        render "/posts/#{post.id}/edit"
      end
  end


  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:message] = "Post deleted"
    redirect_to "/posts"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end

class PostsController < ApplicationController
  
  before_action :authenticate_with_http_digest, except: [:index, :show]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:message] = 'Your post was created successfully'
      redirect_to root_path
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
    @post = Post.find(params[:id])
      if post.update(blog_params)
      flash[:message] = "Sucessfully Updated"
      redirect_to '/posts/#{post.id}/'
      else 
        render "/posts/#{posts.id}/edit"
      end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end

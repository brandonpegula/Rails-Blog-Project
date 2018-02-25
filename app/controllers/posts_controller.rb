class PostsController < ApplicationController
  
# before_action :authenticate, only [:index, :new, :create, :edit]


  def index
    @posts = Post.all
  end

  def create
    # user = User.find(params[:id])
    post = Post.new(post_params)
    if post.save
      flash[:message] = 'Your post was created successfully'
      redirect_to "/"
    else
      flash[:message] = 'try again'
      render "/user/:user_id/posts/new"
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end

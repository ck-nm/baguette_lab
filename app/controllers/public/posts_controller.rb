class Public::PostsController < ApplicationController
  before_action :authenticate_public!
  before_action :ensure_correct_public, only: [:edit, :update, :destroy]
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.public_id = current_public.id
    if @post.save
      redirect_to public_post_path(@post), notice: "You have created post successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to public_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :opinion)
  end

  def ensure_correct_public
    @post = Post.find(params[:id])
    unless @post.user == current_public
      redirect_to public_posts_path
    end
  end
end

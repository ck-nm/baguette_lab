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
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.permit(:title, :opinion)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end

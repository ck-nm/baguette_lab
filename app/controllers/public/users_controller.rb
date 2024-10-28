class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def index
    @publics = Public.all
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to user_path(@user), notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @public.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def set_current_user
    @public = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end

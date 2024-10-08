class Public::UsersController < ApplicationController
  before_action :authenticate_public!
  before_action :ensure_correct_public, only: [:edit, :update]

  def show
  end
  
  def index
    @publics = Public.all
    @post = Post.new
  end

  def edit
  end

  def update
    if @public.update(public_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
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

  def set_current_public
    @public = current_public
  end

  def public_params
    params.require(:public).permit(:name, :introduction, :image)
  end
end

class Admin::UsersController < ApplicationController
  
   before_action :authenticate_admin!
  before_action :ensure_public, only: [:show, :edit, :update]

  def index
    @publics = Public.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    @public.update(public_params) ? (redirect_to admin_public_path(@public)) : (render :edit)
  end

  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

  def ensure_public
    @public = Public.find(params[:id])
  end
end

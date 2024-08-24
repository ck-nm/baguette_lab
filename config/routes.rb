Rails.application.routes.draw do

  devise_for :users
  #devise_for :users
  # ユーザー側のルーティング設定
  scope module: :public do
    root :to =>"homes#top"
  end
  
  
  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => 'homes#top'

  end
end

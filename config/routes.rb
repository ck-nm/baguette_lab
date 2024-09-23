Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :publics,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :public do
    resources :posts # public/post
    get "search" => 'searches#search' # public/search
  end
  
  namespace :admin do
    resources :posts
  end

end

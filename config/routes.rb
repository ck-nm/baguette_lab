Rails.application.routes.draw do
  #root to: "public/homes#top"
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, except: [:destroy]
    resources :reviews, only: [:index, :create, :edit, :update, :destroy]
  end

  # 顧客用
  # URL /publics/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'

    # get 'publics/mypage' => 'users#show', as: 'mypage'
    # get 'publics/information/edit' => 'publics#edit', as: 'edit_information'
    # patch 'publics/information' => 'publics#update', as: 'update_information'
    # get 'publics/unsubscribe' => 'publics#unsubscribe', as: 'confirm_unsubscribe'
    # put 'publics/information' => 'publics#update'
    # patch 'publics/withdraw' => 'publics#withdraw', as: 'withdraw_public'

    resources :users

    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :reviews, only: [:create, :destroy]
    end
  end

end
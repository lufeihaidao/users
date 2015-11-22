Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
    collection do
      get 'page/:page', action: :index
      post 'add', action: :add
      patch ':id/upload_avatar', action: :upload_avatar
    end
  end
  resources :articles do
    member do
      patch 'top_touch', action: :top_touch
    end
  end
  resources :albums do
    resources :images
  end
end

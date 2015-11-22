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
  resources :articles
end

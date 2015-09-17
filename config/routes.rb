Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
    collection do
      get 'page/:page', action: :index
      post 'add', action: :add
    end
  end
end

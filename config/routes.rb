Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :users do
    collection do
      get 'page/:page', :action => :index
    end
  end
end

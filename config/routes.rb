Rails.application.routes.draw do
  get 'shifts/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teams do
    member do
      post :add_member
      get :remove_member
    end
  end

  resources :shifts do
    collection do
      get :get_users
    end
  end

  root 'teams#index'
end

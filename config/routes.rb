Rails.application.routes.draw do

  get 'notifications/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'top#index'

  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  resources :blogs do
    resources :comments
    post :confirm, on: :collection
  end

  resources :users

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :poems, only: [:index, :show]
end

Rails.application.routes.draw do
  devise_for :users,
            controllers: {
              registrations: 'users/registrations',
              sessions: 'users/sessions',
              users: 'users/users',
              omniauth_callbacks:'users/omniauth_callbacks'
            }

  root 'static_pages#home'

  resources :posts do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[new create destroy]
  end
  resources :users, only: %i[show index]
  resources :friendships, except: %i[index]


  
  get '/notifications', to: 'friendships#index'
  get '/friends', to: 'users#friends'
  get 'auth/:provider', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  patch "/friendship", to: "friendships#update"
  
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'signin', to: 'devise/sessions#new'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

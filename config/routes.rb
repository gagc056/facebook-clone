Rails.application.routes.draw do
  devise_for :users,
            controllers: {
              registrations: 'users/registrations',
              sessions: 'users/sessions',
              users: 'users/users'
            }

  root 'static_pages#home'

  resources :posts do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[new create destroy]
  end
  resources :users, only: %i[show index]
  resources :friendships, except: %i[index]
  
  get '/notifications', to: 'friendships#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

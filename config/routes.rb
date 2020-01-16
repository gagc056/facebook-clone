Rails.application.routes.draw do
  devise_for :users,
            controllers: {
              registrations: 'users/registrations',
              sessions: 'users/sessions',
              users: 'users/users'
            }

  root 'static_pages#home'

  resources :posts
  resources :users, only: %i[show index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

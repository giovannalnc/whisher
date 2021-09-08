Rails.application.routes.draw do
  # para que quando o usuario criar uma conta seja criada tb uma lista padrao
  # por isso precisamos add um registrations controller
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, except: :edit do
    resources :products, only: %i[new create]
  end
  resources :products, only: %i[destroy]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lists, only: %i[index show update create destroy]
    end
  end

  get '/services', to: 'pages#services'
  get '/about_us', to: 'pages#about_us'
  root to: 'pages#home'
end

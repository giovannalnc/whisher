Rails.application.routes.draw do
  # para que quando o usuario criar uma conta seja criada tb uma lista padrao
  # por isso precisamos add um registrations controller
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :new, :create]
  resources :lists, only: %i[index show new create]
end

Rails.application.routes.draw do
  # para que quando o usuario criar uma conta seja criada tb uma lista padrao
  # por isso precisamos add um registrations controller
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'pages#home'
  resources :lists, only: %i[index show new create]
end

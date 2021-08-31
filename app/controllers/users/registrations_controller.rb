class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    List.create!(title: 'default', user: current_user)
  end
end

# usamos o super para que o chamar o def create do devise e dps disso
# add criamos a lista padrao para o usuario

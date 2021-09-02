class Users::RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    if current_user
      list = List.create!(title: 'My List', user: current_user)
      list_path(list)
    end
  end
end

# usamos o super para que o chamar o def create do devise e dps disso
# add criamos a lista padrao para o usuario

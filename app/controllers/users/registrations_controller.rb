class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    List.create!(title: 'default', user: current_user)
  end
end

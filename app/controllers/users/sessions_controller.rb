class Users::SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(resource)
    if current_user.lists.count == 1
      list_path(current_user.lists.first)
    else
      lists_path
    end
  end
end

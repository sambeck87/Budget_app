# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    # Aquí puedes personalizar la página de destino
    # después de iniciar sesión para diferentes tipos de usuarios
    user_groups_path(current_user.id)
  end
end

module Users
  class SessionsController < Devise::SessionsController
    def after_sign_in_path_for(_resource)
      user_groups_path(current_user.id)
    end
    def after_sign_up_path_for(resource)
      user_groups_path(current_user.id)
    end
  end
end

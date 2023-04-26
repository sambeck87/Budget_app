class PageController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    return unless user_signed_in?

    redirect_to user_groups_path(current_user.id)
  end
end

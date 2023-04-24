class PageController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
  end
end

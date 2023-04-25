require 'rails_helper'

RSpec.describe UsersController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'sambeck', email: 'sambeck@outlook.com', password: 'todoterreno')
    login_as(@user, scope: :user)
  end

  describe 'GET #index' do
    before do
      get users_path
    end

    it "redirects users to groups page" do
      expect(response).to redirect_to(user_groups_path(user_id: @user.id))
    end
  end
end

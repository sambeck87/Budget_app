require 'rails_helper'

RSpec.describe 'entity', type: :feature do
  include Warden::Test::Helpers
  before :each do
    @user = User.create!(name: 'test', email: 'test@gmail.com', password: 'test12')
    login_as(@user, scope: :user)

    @group = Group.create!(name: 'Home',
                           icon: 'https://www.iconarchive.com/download/12.png', user_id: @user.id)
    @entity1 = Entity.create!(name: 'table', amount: 120.3, author_id: @user.id, groups: [@group])
    @entity2 = Entity.create!(name: 'paint', amount: 230.2, author_id: @user.id, groups: [@group])

    visit user_group_path(user_id: @user.id, id: @group.id)
    @new_entity_url = new_user_group_entity_path(user_id: @user.id, group_id: @group.id)
    @entities_url = user_group_path(user_id: @user.id, id: @group.id)
  end

  context 'testing New trasaction button' do
    before :each do
      click_link 'New transaction'
    end
    it 'New category button should redirect to the create category form ' do
      expect(current_path).to eq(@new_entity_url)
    end

    it 'should display the page name' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'the back button should return to the transactions page' do
      click_link '<-'
      expect(current_path).to eq(@entities_url)
    end
  end
end

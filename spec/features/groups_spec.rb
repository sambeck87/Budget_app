require 'rails_helper'

RSpec.describe 'group', type: :feature do
  include Warden::Test::Helpers
  before :each do
    @user = User.create!(name: 'test', email: 'test@gmail.com', password: 'test12')
    login_as(@user, scope: :user)

    @group = Group.create!(name: 'Home',
                           icon: 'https://www.iconarchive.com/download/i12.png', user_id: @user.id)
    @entity1 = Entity.create!(name: 'table', amount: 120.3, author_id: @user.id, groups: [@group])
    @entity2 = Entity.create!(name: 'paint', amount: 230.2, author_id: @user.id, groups: [@group])

    visit user_groups_path(user_id: @user.id)
    @new_group_url = new_user_group_path(user_id: @user.id)
    @entities_url = user_group_path(user_id: @user.id, id: @group.id)
    @main_page_url = user_groups_path(user_id: @user.id)
  end

  context 'The page should display groups and its total amount' do
    it 'should display the group name and total amount' do
      expect(page).to have_content('Home')
      expect(page).to have_content('350.5')
    end
  end

  context 'Test New category button' do
    it 'New category button should redirect to the create category form ' do
      click_link 'New category'
      expect(current_path).to eq(@new_group_url)
    end
    it 'should display the page name' do
      click_link 'New category'
      expect(page).to have_content('NEW CATEGORY')
    end
  end

  context 'Test click on category' do
    before :each do
      click_link 'Home'
    end

    it 'On click in category should show the entities list page' do
      expect(current_path).to eq(@entities_url)
    end
    it 'should display the entity names' do
      expect(page).to have_content('table')
      expect(page).to have_content('paint')
    end

    it 'should display the entity amounts' do
      expect(page).to have_content('120.3')
      expect(page).to have_content('230.2')
    end
  end

  context 'Test delete button' do
    before :each do
      click_link 'Home'
    end
    it 'There should contain 3 Delete button' do
      expect(page).to have_content('Home')
      click_button 'Delete category'
      expect(page).not_to have_content('Home')
    end
  end

  context 'Test back button' do
    before :each do
      click_link 'Home'
    end
    it 'the back button should return to the main page' do
      click_link '<-'
      expect(current_path).to eq(@main_page_url)
    end
  end
end

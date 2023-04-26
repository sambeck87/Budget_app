require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.create!(name: 'sambeck', email: 'sambeck@outlook.com', password: 'todoterreno')
    @group = Group.create!(name: 'Home',
                           icon: 'https://www.iconarchive.com/download/i2.png', user_id: @user.id)
    Entity.create!(name: 'table', amount: 120.3, author_id: @user.id, groups: [@group])
  end

  before { subject.save }

  context 'Testing validation' do
    it 'Should contain a name attribute' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should contain a name attribute' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'Should contain a name attribute' do
      subject.groups = []
      expect(subject).to_not be_valid
    end

    it 'If the attributes ar fine should be valid' do
      expect(subject).to be_valid
    end
  end
end

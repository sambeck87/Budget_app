require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create!(name: 'sambeck', email: 'sambeck@outlook.com', password: 'todoterreno')
    Group.create!(name: 'Home',
                  icon: 'https://www.iconarchive.com/download/i103430/paomedia/smhouse.512.png', user_id: @user.id)
  end

  before { subject.save }

  context 'Testing validation' do
    it 'should have a name attribute present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an icon attribute present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'the icon value should be a link' do
      subject.icon = 'any text'
      expect(subject).to_not be_valid
    end

    it 'If the attributes ar fine should be valid' do
      expect(subject).to be_valid
    end
  end
end

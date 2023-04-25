require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'sambeck', email: 'sambeck@outlook.com', encrypted_password: 'todoterreno')
  end

  before { subject.save }

  context 'User should create a user with name' do
    it 'should have a name attribute present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be "sambeck"' do
      expect(subject.name).to eq('sambeck')
    end
  end
  context 'User email should be required' do
    it 'should have an email attribute present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'email should be "sambeck@outlook.com"' do
      expect(subject.email).to eq('sambeck@outlook.com')
    end
  end

  context 'User password should be required' do
    it 'should have a password attribute present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'name should be "todoterreno"' do
      expect(subject.encrypted_password).to eq('todoterreno')
    end
  end
end

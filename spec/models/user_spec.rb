require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it "cannot be created without a first and a last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it 'cannot be created without a phone_number' do
      @user.phone_number = nil
      expect(@user).not_to be_valid
    end

    it 'requires the phone attribute to only contain integers' do
      @user.phone_number = "jfkngkasfas"
      expect(@user).not_to be_valid
    end

    it 'requires the phone number to be longer than 9 characters' do
      @user.phone_number = "01234567"
      expect(@user).not_to be_valid
    end
  end

  describe "custom name method" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("Doe, John")
    end
  end
end


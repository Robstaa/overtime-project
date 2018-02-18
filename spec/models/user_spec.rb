require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user= User.create(email: "test@test.com", password: "123456", first_name: "Robstaa", last_name: "Sushi")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without a first and a last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end

  describe "custom name method" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("Sushi, Robstaa")
    end
  end
end


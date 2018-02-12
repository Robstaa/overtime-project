require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user= User.create(email: "test@test.com", password: "123456", first_name: "Test", last_name: "Me")
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
end


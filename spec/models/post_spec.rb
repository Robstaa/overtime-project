require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(email: "test2@test.com", password: "123456", first_name: "Test", last_name: "Me")
    login_as(@user, scope: :user)
  end

  describe 'creation' do
    it 'can be created' do
      post = Post.create(date: Date.today, rationale: "This is a test", user_id: @user.id)
      expect(post).to be_valid
    end

    it 'must have date and rationale' do
      post = Post.create(date: nil, rationale: nil)
      expect(post).to_not be_valid
    end
  end
end

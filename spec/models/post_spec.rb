require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'creation' do
    it 'can be created' do
      post = FactoryBot.create(:post)
      expect(post).to be_valid
    end

    it 'must have date and rationale' do
      post = Post.create(date: nil, rationale: nil, overtime_request: 2.5)
      expect(post).to_not be_valid
    end

    it 'must have an overtime request' do
      post = Post.create(date: Date.today, rationale: "just another one", overtime_request: nil, user_id: @user.id)
      expect(post).not_to be_valid
    end

    it 'must have an overtime request above 0' do
      post = Post.create(date: Date.today, rationale: "just another one", overtime_request: 0, user_id: @user.id)
      expect(post).not_to be_valid
    end
  end
end

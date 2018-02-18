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
      post = Post.create(date: nil, rationale: nil)
      expect(post).to_not be_valid
    end
  end
end

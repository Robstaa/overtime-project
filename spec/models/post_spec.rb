require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    it 'can be created' do
      post = Post.create(date: Date.today, rationale: "This is a test")
      expect(post).to be_valid
    end

    it 'must have date and rationale' do
      post = Post.create(date: nil, rationale: nil)
      expect(post).to_not be_valid
    end
  end
end

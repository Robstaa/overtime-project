require 'rails_helper'

describe 'Homepage' do
  it 'allows the admin to approve posts from the homepage' do
    admin = FactoryBot.create(:admin)
    post = FactoryBot.create(:post)
    login_as(admin, scope: :user)

    visit root_path
    # visit edit_post_path(post)
    click_link("approve_#{post.id}")

    expect(post.reload.status).to eq("approved")
  end
end

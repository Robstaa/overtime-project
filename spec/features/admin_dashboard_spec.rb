require 'rails_helper'

describe 'Admin Dashboard' do

  describe 'navigation' do
    it 'can be reached' do
      visit admin_root_path
      expect(page.status_code).to eq(200)
    end

    it 'redirects to "Sign in" for users who are not signed in' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'cannot be reached by regular users' do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit admin_root_path

      expect(current_path).not_to eq(admin_root_path)
    end

    it 'can be reached by admin users' do
      admin = FactoryBot.create(:admin)
      login_as(admin, scope: :user)

      visit admin_root_path

      expect(current_path).to eq(admin_root_path)
    end
  end

  describe 'post status' do
    before do
      admin = FactoryBot.create(:admin)
      login_as(admin, scope: :user)
      @post = FactoryBot.create(:post)
    end

    it 'can be changed by admin' do
      visit edit_admin_post_path(@post)

      select("approved", from: "post_status", visible: false).select_option
      click_button("Update Post")

      expect(page).to have_content("approved")
    end
  end
end

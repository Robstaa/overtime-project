require 'rails_helper'

describe 'AuditLog' do
  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
    @audit_log = FactoryBot.create(:audit_log)
    login_as(@admin, scope: :user)
  end

  describe 'index' do
    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content("Doe, John")
    end

    it 'cannot be accessed by non admin users' do
      logout(@admin)
      login_as(@user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(posts_path)
    end
  end
end

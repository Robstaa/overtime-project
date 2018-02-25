require 'rails_helper'
require 'pry-byebug'

describe 'Homepage' do
  it 'allows the admin to approve posts from the homepage' do
    logout(:user)
    admin = FactoryBot.create(:admin)
    post = FactoryBot.create(:post)
    login_as(admin, scope: :user)

    visit root_path
    # visit edit_post_path(post)
    click_link("approve_#{post.id}")

    expect(post.reload.status).to eq("approved")
  end

  it 'allows the user to change the audit log status from the homepage' do
    log_user = Employee.create(first_name: "log", last_name: "user", email: "edit@user.com", password: "123456", phone_number: "0123456789")
    audit_log = AuditLog.create!(start_date: Date.today - 6.days, status: "pending", user_id: log_user.id)
    login_as(log_user, scope: :user)
    visit root_path
    click_link("approve_#{audit_log.id}")

    expect(audit_log.reload.status).to eq("confirmed")
  end
end

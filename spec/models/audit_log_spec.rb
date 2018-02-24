require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryBot.create(:audit_log)
  end
  describe 'creation' do
    it 'can be created' do
      expect(@audit_log).to be_valid
    end
  end

  describe 'validation' do
    it 'should be required to have a user association' do
      @audit_log.update(user_id: nil)
      expect(@audit_log).not_to be_valid
    end

    it 'should always have a status' do
      @audit_log.update(status: nil)
      expect(@audit_log).not_to be_valid
    end

    it 'should have a start date' do
      @audit_log.update(start_date: nil)
      expect(@audit_log).not_to be_valid
    end

    it 'should have a start date to six days prior' do
      @audit_log.update(start_date: Date.today - 6.days)
      expect(@audit_log).to be_valid
    end

    it 'should set start date to six days prior if no start_date is given' do
      new_audit_log = AuditLog.create(status: 0, user_id: User.last.id)
      expect(new_audit_log).to be_valid
    end
  end
end

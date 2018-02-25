class Post < ApplicationRecord
  enum status: {submitted: 0, approved: 1, rejected: 2}
  validates :date, presence: true
  validates :rationale, presence: true
  validates :overtime_request, presence: true, numericality: {greater_than: 0.0}
  belongs_to :user

  after_save :update_audit_log

  private

    def update_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
      audit_log.confirmed! if audit_log
    end
end

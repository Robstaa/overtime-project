class AuditLog < ApplicationRecord
  enum status: [:pending, :confirmed]
  belongs_to :user
  validates :user_id, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  # validate  :start_date_must_be_six_days_in_the_past
  after_initialize :set_defaults

  before_update :set_end_date, if: :confirmed?

  private

    def start_date_must_be_six_days_in_the_past
      if start_date.present? && start_date != Date.today - 6.days
        errors.add(:start_date, "must be six days in the past")
      end
    end

    def set_defaults
      self.start_date ||= Date.today - 6.days
    end

    def set_end_date
      self.end_date = Date.today
    end
end

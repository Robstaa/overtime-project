class Post < ApplicationRecord
  enum status: {submitted: 0, approved: 1, rejected: 2}
  validates :date, presence: true
  validates :rationale, presence: true
  belongs_to :user
end

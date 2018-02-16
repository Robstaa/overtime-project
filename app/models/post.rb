class Post < ApplicationRecord
  validates :date, presence: true
  validates :rationale, presence: true
  belongs_to :user
end

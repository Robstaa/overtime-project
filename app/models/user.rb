class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, length: {minimum: 9}
  has_many :posts
  has_many :audit_logs

  PHONE_REGEX = /\A[0-9]+\z/

  validates_format_of :phone_number, with: PHONE_REGEX

  def full_name
    "#{last_name}, #{first_name}"
  end
end

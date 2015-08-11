class Bearer < ActiveRecord::Base
  belongs_to :club
  validates :club_id, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end

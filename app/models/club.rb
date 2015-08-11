class Club < ActiveRecord::Base
  mount_uploader :avatar, ClubAvatarUploader
  has_many :bearers
  has_many :club_posts
  has_many :club_events
  has_many :announcements
  before_save { self.club_login = club_login.downcase }
  validates :club_name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  validates :club_number, presence: true
  validates :club_login, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}

  def self.search(query)
    where("club_name like ?", "%#{query}%")
  end
end

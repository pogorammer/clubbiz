class Student < ActiveRecord::Base
  has_many :student_tickets
  has_many :feedbacks

  mount_uploader :avatar, StudentAvatarUploader
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}

  def Student.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Student.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = Student.digest(Student.new_remember_token)
  end


end

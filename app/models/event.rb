class Event < ActiveRecord::Base
  has_many :club_events
  has_many :tickets
  has_many :student_tickets
  has_many :feedbacks

  mount_uploader :img1, EventImgUploader
  mount_uploader :img2, EventImgUploader
  mount_uploader :img3, EventImgUploader

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end

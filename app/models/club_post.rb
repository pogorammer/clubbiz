class ClubPost < ActiveRecord::Base
  belongs_to :club
  validates :post, presence: true, length: {maximum: 250}
end

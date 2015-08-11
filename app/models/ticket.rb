class Ticket < ActiveRecord::Base
  belongs_to :event
  has_many :student_tickets
end

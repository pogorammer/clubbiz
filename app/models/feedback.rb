class Feedback < ActiveRecord::Base
  belongs_to :event
  belongs_to :student
end

class StudentTicket < ActiveRecord::Base
  belongs_to :student
  belongs_to :ticket
  belongs_to :event
end

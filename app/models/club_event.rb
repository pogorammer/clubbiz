class ClubEvent < ActiveRecord::Base
  belongs_to :club
  belongs_to :event

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

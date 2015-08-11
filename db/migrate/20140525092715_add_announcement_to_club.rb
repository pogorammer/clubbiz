class AddAnnouncementToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :announcement, :string
  end
end

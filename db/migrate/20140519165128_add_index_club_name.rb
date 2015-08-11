class AddIndexClubName < ActiveRecord::Migration
  def change
    add_index :clubs, :club_name, unique: true
  end
end

class AddValidClub < ActiveRecord::Migration
  def change
    add_column :clubs, :club_valid, :boolean, default: false
  end
end

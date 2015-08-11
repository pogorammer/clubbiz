class AddClubIdToBearer < ActiveRecord::Migration
  def change
    add_column :bearers, :club_id, :integer
    add_index :bearers, :club_id
  end
end

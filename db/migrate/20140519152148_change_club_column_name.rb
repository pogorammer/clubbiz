class ChangeClubColumnName < ActiveRecord::Migration
  def change
    rename_column :clubs, :name, :club_name
    rename_column :clubs, :number, :club_number
    rename_column :clubs, :login_id, :club_login
  end
end

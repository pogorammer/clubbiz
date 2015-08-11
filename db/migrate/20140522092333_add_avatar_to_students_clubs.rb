class AddAvatarToStudentsClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :avatar, :string
    add_column :students, :avatar, :string
  end
end

class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :number
      t.string :url
      t.string :login_id
      t.string :password_digest

      t.timestamps
    end
  end
end

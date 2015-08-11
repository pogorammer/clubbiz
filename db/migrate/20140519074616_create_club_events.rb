class CreateClubEvents < ActiveRecord::Migration
  def change
    create_table :club_events do |t|
      t.integer :club_id
      t.integer :event_id
      t.timestamps
    end

    add_index :club_events, :club_id
    add_index :club_events, :event_id
    add_index :club_events, [:club_id, :event_id], unique: true
  end
end

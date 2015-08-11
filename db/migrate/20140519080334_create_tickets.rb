class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :type
      t.decimal :price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :event_id

      t.timestamps
    end
    add_index :tickets, :event_id
  end
end

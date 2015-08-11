class CreateStudentTickets < ActiveRecord::Migration
  def change
    create_table :student_tickets do |t|
      t.integer :student_id
      t.integer :ticket_id
      t.integer :event_id
      t.integer :amount
      t.decimal :paid

      t.timestamps
    end

    add_index :student_tickets, :student_id
    add_index :student_tickets, :ticket_id
    add_index :student_tickets, :event_id
  end
end

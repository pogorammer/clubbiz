class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :post
      t.integer :student_id
      t.integer :event_id

      t.timestamps
    end
  end
end

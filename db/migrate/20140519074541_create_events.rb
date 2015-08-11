class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :url
      t.string :description
      t.timestamps
    end
  end
end

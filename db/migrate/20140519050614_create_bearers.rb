class CreateBearers < ActiveRecord::Migration
  def change
    create_table :bearers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :position
      t.boolean :is_administrator

      t.timestamps
    end
  end
end

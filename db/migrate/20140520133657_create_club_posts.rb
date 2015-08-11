class CreateClubPosts < ActiveRecord::Migration
  def change
    create_table :club_posts do |t|
      t.string :post
      t.integer :club_id

      t.timestamps
    end

    add_index :club_posts, :club_id
  end
end

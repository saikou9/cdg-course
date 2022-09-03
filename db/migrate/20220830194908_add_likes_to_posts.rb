class AddLikesToPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |f|
      f.references :account
      f.references :post

      f.timestamps
    end

    add_index :likes, [:user_id, :post_id], unique:  true
  end
end

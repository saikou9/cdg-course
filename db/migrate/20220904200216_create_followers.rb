class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :follower_id, references: :accounts
      t.references :following_id, references: :accounts
      t.timestamps
    end
  end
end

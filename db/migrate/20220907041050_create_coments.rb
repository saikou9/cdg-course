class CreateComents < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :account
      t.string :comment

      t.timestamps
    end
  end
end

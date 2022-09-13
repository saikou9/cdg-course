class DropComents < ActiveRecord::Migration[7.0]
  def change
    drop_table :coments

    add_column :comments, :comment, :string
  end
end

class AddImageToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :avatar, :string
    add_column :accounts, :description, :text
    add_column :accounts, :website, :string
  end
end

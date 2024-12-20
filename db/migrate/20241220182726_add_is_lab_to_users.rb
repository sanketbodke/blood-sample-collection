class AddIsLabToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :is_lab, :boolean, default: false
  end
end

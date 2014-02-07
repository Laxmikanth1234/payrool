class ChangeEmployeeNumber < ActiveRecord::Migration
  def up
    remove_column :users, :number
    add_column :users, :number, :text
  end

  def down
  end
end

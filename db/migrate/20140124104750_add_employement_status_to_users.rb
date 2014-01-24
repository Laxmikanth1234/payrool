class AddEmployementStatusToUsers < ActiveRecord::Migration
  def change
   add_column :users, :employement_status, :string
  end
end

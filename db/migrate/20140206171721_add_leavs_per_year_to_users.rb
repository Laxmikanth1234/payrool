class AddLeavsPerYearToUsers < ActiveRecord::Migration
  def change
   add_column :users, :leaves_per_year, :integer
  end
end

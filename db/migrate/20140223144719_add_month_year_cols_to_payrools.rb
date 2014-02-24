class AddMonthYearColsToPayrools < ActiveRecord::Migration
  def change
    add_column :payrolls, :month, :integer
    add_column :payrolls, :year, :integer
  end
end

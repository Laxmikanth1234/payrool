class AddTotalWorkingDays < ActiveRecord::Migration
  def up
    add_column :time_sheets, :total_working_days, :integer
    add_column :time_sheets, :total_logged_days, :integer
    add_column :time_sheets, :total_holidays, :integer
  end

  def down
  end
end

class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|

      t.timestamps
    end
  end
end

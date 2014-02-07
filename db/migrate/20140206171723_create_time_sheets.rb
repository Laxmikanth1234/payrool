class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.integer :user_id
      t.integer :manager_id
      t.string :status
      t.text :logged_hours
      t.integer :month
      t.integer :year
      t.date :start_date
      t.date :end_date
      t.text :remarks
      t.timestamps
    end
  end
end

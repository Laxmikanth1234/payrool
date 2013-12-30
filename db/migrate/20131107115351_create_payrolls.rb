class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.integer :user_id
      t.integer :basic, :default =>  0
      t.integer :hra, :default =>  0
      t.integer :travel, :default =>  0
      t.integer :daily, :default =>  0
      t.integer :medical, :default =>  0
      t.integer :other, :default =>  0
      t.integer :variable, :default =>  0
      t.integer :gross, :default =>  0
      t.integer :professional_tax, :default =>  0
      t.integer :pf, :default =>  0
      t.integer :esi, :default =>  0
      t.integer :tds, :default =>  0
      t.integer :advance_salary, :default =>  0
      t.integer :total_deductions, :default =>  0
      t.integer :net_salary, :default =>  0
      t.integer :total_working_days, :default =>  0
      t.integer :working_days, :default =>  0
      t.string :payroll_month_year

      t.timestamps
    end
  end
end

class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :employe_id
      t.integer :basic
      t.integer :hra
      t.integer :travel
      t.integer :daily
      t.integer :medical
      t.integer :other
      t.integer :variable
      t.integer :gross
      t.integer :professional_tax
      t.integer :pf
      t.integer :esi
      t.integer :total_deductions
      t.integer :net_salary
      t.boolean :active

      t.timestamps
    end
  end
end

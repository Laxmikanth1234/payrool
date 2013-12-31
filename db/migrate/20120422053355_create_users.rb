class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :password
      t.integer  :manager_id
      t.integer  :role_id
      t.date     :end_date
      t.integer  :salary
      t.integer  :leave_used
      t.string 	 :first_name
      t.string 	 :middle_name
      t.string 	 :last_name
      t.date   	 :date_of_birth
      t.string   :sex
      t.string   :pan
      t.string   :designation
      t.boolean  :active, :default => false
      t.string   :mobile_number
      t.datetime :date_of_joining
      t.text 	   :address
      t.integer  :last_down_ctc
      t.integer :number
      t.text :bank_name
      t.text :name_in_bank
      t.text :act_number
      t.text :ifsc_code
      t.timestamps
    end
  end
end

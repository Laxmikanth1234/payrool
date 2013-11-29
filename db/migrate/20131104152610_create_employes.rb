class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.string 	  :number
      t.string 	  :first_name
      t.string 	  :middle_name
      t.string 	  :last_name
      t.date   	  :date_of_birth
      t.string    :sex
      t.string    :email
      t.string    :pan
      t.string    :designation
      t.boolean   :active, :default => false
      t.string    :mobile_number
      t.datetime  :date_of_joining
      t.text 	  :address
      t.integer   :last_down_ctc
      
      t.timestamps
    end
  end
end

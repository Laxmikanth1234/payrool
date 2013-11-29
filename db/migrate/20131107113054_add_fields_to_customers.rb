class AddFieldsToCustomers < ActiveRecord::Migration
  def change
  	add_column :employes, :bank_name, :string
  	add_column :employes, :act_number, :string
  	add_column :employes, :ifsc_code, :string
  	add_column :employes, :name_in_bank, :string
  end
end

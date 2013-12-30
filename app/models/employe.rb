class Employe < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :number, :first_name, :middle_name, :last_name, :date_of_birth, :sex, :email, :pan, :designation, :mobile_number, :date_of_joining, :address, :last_down_ctc, :bank_name, :name_in_bank, :act_number, :ifsc_code

  has_many :salaries, :order => "created_at desc", :dependent => :destroy
  has_many :payrolls, :order => "created_at desc", :dependent => :destroy
  validates :number, :first_name, :middle_name, :last_name, :date_of_birth, :sex, :email, :pan, :designation, :mobile_number, :date_of_joining, :address, :last_down_ctc, presence: true
  def name
  	return [self.first_name, self.middle_name, self.last_name].join(' ')
  end

  def salary
  	return self.salaries.first
  end
end

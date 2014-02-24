class Payroll < ActiveRecord::Base
  attr_accessible :advance_salary, :basic, :daily, :employe, :esi, :gross, :hra, :medical, :net_salary, :other, :payroll_month_year, :pf, :professional_tax, :tds, :total_deductions, :total_working_days, :travel, :variable, :working_days
  belongs_to :user
  MONTH_ARRAY = {"" => "Month","1" => "Jan", "2" => "Feb","3" => "Mar","4" => "Apr","5" => "May","6" => "Jun","7" => "Jul","8" => "Aug","9" => "Sep","10" => "Oct","11" => "Nov","12" => "Dec"}
  
  def calculate_salary(salary)
    puts salary.inspect
    puts self.inspect
    puts (self.working_days / self.total_working_days.to_d)
    puts (self.working_days / self.total_working_days).to_d
  	self.basic = (salary.basic_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.daily = (salary.daily_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.esi = (salary.esi_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.hra = (salary.hra_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.medical = (salary.medical_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.other = (salary.other_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.pf = (salary.pf_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.professional_tax = (salary.professional_tax_per_month * (self.working_days / self.total_working_days.to_d)).round
  	
  	self.travel = (salary.travel_per_month * (self.working_days / self.total_working_days.to_d)).round
  	self.variable = (salary.variable_per_month * (self.working_days / self.total_working_days.to_d)).round

    self.tds = tds_calculation(salary)
  	self.gross = self.basic + self.daily + self.hra + self.medical + self.other + self.travel + self.variable
  	self.total_deductions =  self.esi + self.pf + self.professional_tax + self.tds + self.advance_salary
  	self.net_salary = self.gross - self.total_deductions
  end

  def tds_calculation(salary)
    if(salary.net_salary*12 > 200000) 
      exemption = 200000
      lta = 30000
      mediacal = 15000
      conveyance = 9600
      total_exemptions = exemption + lta + mediacal + conveyance
      total_income = salary.net_salary
      taxable_amt = (total_income - total_exemptions.to_d)/12
      tax = taxable_amt * 0.1
      cess = tax * 0.03
      return tax + cess
    else
      return 0
    end
  end
end

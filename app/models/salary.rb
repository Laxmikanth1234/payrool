class Salary < ActiveRecord::Base
  attr_accessible :basic, :daily, :employe, :esi, :gross, :hra, :medical, :net_salary, :other, :pf, :professional_tax, :total_deductions, :travel, :variable, :active
  belongs_to :user

  def basic_per_month
  	return basic
  end

  def daily_per_month
  	return daily
  end

  def esi_per_month
  	return esi
  end

  def hra_per_month
  	return hra
  end

  def medical_per_month
  	return medical
  end

  def other_per_month
  	return other
  end

  def gross_per_month
    return gross
  end

  def pf_per_month
  	return pf
  end

  def professional_tax_per_month
  	return professional_tax
  end

  def travel_per_month
  	return travel
  end

  def variable_per_month
  	return variable
  end

end

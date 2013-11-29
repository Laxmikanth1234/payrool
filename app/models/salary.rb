class Salary < ActiveRecord::Base
  attr_accessible :basic, :daily, :employe, :esi, :gross, :hra, :medical, :net_salary, :other, :pf, :professional_tax, :total_deductions, :travel, :variable, :active
  belongs_to :employe

  def basic_per_month
  	return basic/12
  end

  def daily_per_month
  	return daily/12
  end

  def esi_per_month
  	return esi/12
  end

  def hra_per_month
  	return hra/12
  end

  def medical_per_month
  	return medical/12
  end

  def other_per_month
  	return other/12
  end

  def gross_per_month
    return gross/12
  end

  def pf_per_month
  	return pf/12
  end

  def professional_tax_per_month
  	return professional_tax/12
  end

  def travel_per_month
  	return travel/12
  end

  def variable_per_month
  	return variable/12
  end

end

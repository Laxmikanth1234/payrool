class UserMailer < ActionMailer::Base
  default from: "itsupport@vivedaglobal.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def himail(user)
   data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments['logo.png'] = data
    mail(:to => "#{user.name} <chandrasekharjangam@gmail.com>", :subject => "Registered")
  end

  def password_reset
    @greeting = "Hi"
    mail to: "chandrasekharjangam@gmail.com"
  end
  
  def payslip_mail(payroll,pdf,request)
    @payroll = payroll
    @request = request
    data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments.inline['logo.png'] = data
    
    attachments["#{@payroll.user.name}-#{@payroll.payroll_month_year}.pdf"] = pdf
    mail(:to => "#{@payroll.user.name} <chandrasekharjangam@gmail.com>", :subject => "Payslip")
  end
  
  def leave_email(leave,request)
    @leave = leave
    @request = request
    data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments.inline['logo.png'] = data
    mail(:to => "#{leave.user.name} <#{leave.user.email}>", :subject => "Leave Application")
  end
  
  def leave_approve_notfication(leave,request)
    @leave = leave
    @request = request
    data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments.inline['logo.png'] = data
    mail(:to => "#{leave.user.name} <#{leave.user.email}>", :subject => "Leave Application Approved")
  end
  
  def leave_reject_notfication(leave,request)
    @leave = leave
    @request = request
    data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments.inline['logo.png'] = data
    mail(:to => "#{leave.user.name} <#{leave.user.email}>", :subject => "Leave Application Rejected")
  end
  
end

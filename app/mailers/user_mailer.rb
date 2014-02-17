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
  
  
  def leave_email(leave,request)
    @leave = leave
    @request = request
    data = File.read(Rails.root.join('public/assets/Logo-website2.png'))
    attachments.inline['logo.png'] = data
    mail(:to => "#{leave.user.name} <chandrasekharjangam@gmail.com>", :subject => "Leave Application")
  end
  
  
end

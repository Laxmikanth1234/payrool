class UserMailer < ActionMailer::Base
  default from: "itsupport@vivedaglobal.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def himail(user)
   data = File.read(Rails.root.join('public/assets/home2.png'))
   # attachments.inner['logo'] = data
    mail(:to => "#{user.name} <chandrasekharjangam@gmail.com>", :subject => "Registered")
  end

  def password_reset
    @greeting = "Hi"
    mail to: "chandrasekharjangam@gmail.com"
  end
end

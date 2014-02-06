ActionMailer::Base.smtp_settings = {
  :address              => "smtp.vivedaglobal.com",
  :port                 => 25,
  :domain               => "my.hostmonster.com",
  :user_name            => ENV["SMPT_PAYROLL_UNAME"],
  :password             => ENV["SMPT_PAYROLL_PWD"],
  :authentication       => :plain,
  :openssl_verify_mode  => 'none',
  :enable_starttls_auto => true
}
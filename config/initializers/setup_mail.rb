ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "itsupp0rtviveda@gmail.com",
  :password             => "chandra14-13",
  :authentication       => :plain,
  :openssl_verify_mode  => 'none',
  :enable_starttls_auto => true
}
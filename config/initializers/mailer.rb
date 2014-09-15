ActionMailer::Base.default_url_options[:host] = configatron.host
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mailgun.org",
  :port                 => 587,
  :domain               => configatron.smtp.domain,
  :user_name            => configatron.smtp.username,
  :password             => configatron.smtp.password,
  :authentication       => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.asset_host = "http://#{configatron.host}"
ActionMailer::Base.default_url_options[:host] = configatron.host
ActionMailer::Base.delivery_method = :mailgun
ActionMailer::Base.mailgun_settings = {
    api_key: configatron.mailgun.api_key,
    domain: configatron.mailgun.domain
  }

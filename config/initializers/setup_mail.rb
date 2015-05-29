# config.action_mailer.delivery_method = :smtp
  # SMTP settings for mailgun
  ActionMailer::Base.smtp_settings = {
    :port           => 587,
    :address        => "smtp.mailgun.org",
    :domain         => ENV['domain'],
    :user_name      => ENV['username'],
    :password       => ENV['password'],
    :authentication => :plain,
  }
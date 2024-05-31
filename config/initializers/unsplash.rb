Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials[:unsplash_access_key]
  config.application_secret = Rails.application.credentials[:unsplash_secret_key]
  config.utm_source = Rails.application.credentials[:unsplash_redirect]
  config.utm_source = Rails.application.credentials[:unsplash_id]
end

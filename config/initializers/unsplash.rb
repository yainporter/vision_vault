Unsplash.configure do |config|
    config.application_access_key = ENV["unsplash_access_key"]
    config.application_secret = ENV["unsplash_secret_key"]
    config.utm_source = ENV["unsplash_redirect"]
    config.utm_source = ENV["unsplash_id"]
end

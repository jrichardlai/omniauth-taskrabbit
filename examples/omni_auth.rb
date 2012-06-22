Rails.application.config.middleware.use OmniAuth::Builder do
  provider :taskrabbit, ENV['TR_API_KEY'], ENV['TR_SECRET']
end

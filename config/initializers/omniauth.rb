OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, Rails.application.secrets.ENV['FACEBOOK_APP_ID'],
 Rails.application.secrets.ENV['FACEBOOK_APP_SECRET'], scope: ‘public_profile’, info_fields: ‘id,name,link’
end

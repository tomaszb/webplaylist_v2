OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '177580619107878', '18c809ff01ef5f7c7ebc36911ec55370'
end
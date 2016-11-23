OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '193029654443619', '9271b9b7872ddb0b49ed7cf129185372', :setup => true
end
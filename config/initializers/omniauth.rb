OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1858665697733804', '61e22fb09f526f881e2bc35abe25161a', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
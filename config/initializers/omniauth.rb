OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '487006258066838', '69dd3f07962c73bdd03882d5eb48c813'
end
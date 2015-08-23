protocol = Rails.application.config.force_ssl ? "https://" : "http://"
host = ActionController::Base.asset_host

CarrierWave.configure do |config|
  config.asset_host = protocol + host
end

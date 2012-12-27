require 'omniauth/strategies/steam'
module OmniAuth
  module Strategies
    # tell OmniAuth to load our strategy
    autoload :Steam, 'lib/omniauth/strategies/steam'
  end
end

# move back into application.rb?
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, APP_CONFIG["api_key"]
end

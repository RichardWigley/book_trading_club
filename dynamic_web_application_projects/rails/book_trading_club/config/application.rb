require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookTradingClub
  # Application
  #  - Rails::Application is responsible for executing all railties
  #    and engine initializers
  #
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |generator|
      generator.test_framework :minitest, spec: false, fixture: false
    end
  end
end

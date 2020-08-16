require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Catechismo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    if ENV['QUOTA'].blank?
      ENV['QUOTA'] = '15'
    end
    
    if ENV['FUSO_ORARIO'].blank?
      ENV['FUSO_ORARIO'] = 'Europe/Rome'
    end

    config.time_zone = ENV['FUSO_ORARIO']

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

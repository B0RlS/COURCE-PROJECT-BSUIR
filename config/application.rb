# frozen_string_literal: true

require_relative 'boot'


require 'rails/all'
require 'active_storage'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# Module for IWRProject
module IwrProject
  # Application class for project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.stylesheets = false
    config.generators.javascripts = false
    

    # this option is disabled due to Heroku
    config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence
    # over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
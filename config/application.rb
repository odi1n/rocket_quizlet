require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "active_storage/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RocketQuizlet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec
      g.view_specs false
      g.helper_specs false
      g.feature_specs false
      g.template_engine :slim
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end

    config.i18n.locale = :ru
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [:ru, :en]

    config.i18n.enforce_available_locales = true
    # config.active_record.schema_format = :sql

    config.autoload_paths += %W(#{config.root}/extra)
    config.eager_load_paths += %W(#{config.root}/extra)

    config.time_zone = 'Europe/Moscow'

    config.webpack.dev_server.manifest_port = 3601
    #config.webpack.dev_server.manifest_host = "192.168.1.1"
    config.webpack.dev_server.host = proc { request.host }
    config.webpack.dev_server.port = 3601
    config.webpack.manifest_type = "manifest"
    config.webpack.dev_server.enabled = Rails.env.development?
  end
end


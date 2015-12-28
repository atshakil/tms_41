require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tms41
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  
     config.i18n.enforce_available_locales = false
     config.i18n.available_locales = [:en] # comma separated(:yml_file_names)
     config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.default_url_options = {host: "localhost", port: "3000"}
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address:              "smtp.gmail.com",
        port:                 587,
        domain:               "gmail.com",
        user_name:            ENV["GMAIL_USERNAME"],
        password:             ENV["GMAIL_USERNAME"],
        authentication:       "plain",
        enable_starttls_auto: true  }
     config.generators do |g|
       g.test_framework :rspec,
       fixtures: true,
       view_specs: true,
       helper_specs: true,
       routing_specs: true,
       controller_specs: true,
       request_specs: true
       g.fixture_replacement :factory_girl, dir: "spec/factories"
     end
  end
end

require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module WebsiteWeb
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework      :rspec
      g.view_specs false
      g.helper_specs true
    end

    config.autoload_paths += Dir["#{config.root}/app/workers/*",
                                 "#{config.root}/lib/*",
                                 "#{config.root}/app/models/ckeditor"]

    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache',{ expires_in: 90.minutes }

    config.default_email_address = "no-reply@example.com"

    config.action_mailer.default from: config.default_email_address

    config.rails_admin = ActiveSupport::OrderedOptions.new
    config.rails_admin.autoreload = false
    config.encoding = "utf-8"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.default_locale = 'es-UY'
    config.i18n.fallbacks =[:'es-UY', :en]
  end
end

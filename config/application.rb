require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Cmom
  class Application < Rails::Application
    config.i18n.default_locale = :es
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_record.identity_map = true
    config.assets.enabled = true

    config.to_prepare do
      Dir[Rails.root + "lib/models/**/*.rb"].sort.each {|f| load File.expand_path(f)}
    end
  end
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end


module Cmom
  class Application < Rails::Application
    config.i18n.default_locale = :es
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_record.identity_map = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    config.assets.precompile += ['admin.js', 'admin.css']
    config.assets.initialize_on_precompile = false

    config.to_prepare do
      Dir[Rails.root + "lib/models/**/*.rb"].sort.each { |f| load File.expand_path(f) }
    end
  end
end

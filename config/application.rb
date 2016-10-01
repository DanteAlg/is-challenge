require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module IsChallenge
  class Application < Rails::Application
    config.generators do |g|
      g.factory_girl false
    end

    config.time_zone = ENV.fetch('TZ', 'Brasilia')
    config.i18n.enforce_available_locales = true

    config.i18n.load_path += Dir[File.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

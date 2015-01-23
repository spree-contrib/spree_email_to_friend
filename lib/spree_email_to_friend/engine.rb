require 'recaptcha/rails'

module Spree::Captcha
end

module SpreeEmailToFriend
  class Engine < Rails::Engine
    engine_name 'spree_email_to_friend'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'spree.email_to_friend.preferences', after: 'spree.environment' do
      Spree::Captcha::Config = Spree::CaptchaConfiguration.new
    end

    def activate
      cache_klasses = %W(#{config.root}/app/**/*_decorator*.rb #{config.root}/app/overrides/*.rb)
      Dir.glob(cache_klasses) do |klass|
        Rails.configuration.cache_classes ? require(klass) : load(klass)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end

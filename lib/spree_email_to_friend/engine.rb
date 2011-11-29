require 'recaptcha/rails'

module SpreeEmailToFriend
  class Engine < Rails::Engine
    engine_name 'spree_email_to_friend'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      #Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
      #  Rails.application.config.cache_classes ? require(c) : load(c)
      #end
      Spree::CaptchaConfiguration.find_or_create_by_name("Default spree_captcha configuration")
    end

    config.to_prepare &method(:activate).to_proc
  end
end

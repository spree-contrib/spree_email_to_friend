require 'recaptcha/rails'
require 'httpclient'
require 'cloudsponge'

module Spree::Captcha
end

module Spree::Cloudsponge
end

module SpreeEmailToFriend
  class Engine < Rails::Engine
    engine_name 'spree_email_to_friend'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.email_to_friend.preferences", :after => "spree.environment" do |app|
      Spree::Captcha::Config = Spree::CaptchaConfiguration.new
    end
    
    initializer "spree.email_to_cloud.preferences", :after => "spree.environment" do |app|
      Spree::Cloudsponge::Config = Spree::CloudspongeConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      #Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
      #  Rails.application.config.cache_classes ? require(c) : load(c)
      #end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

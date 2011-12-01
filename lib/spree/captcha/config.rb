module Spree
  module Captcha
    class Config
      include Singleton
      include PreferenceAccess

      class << self
        def instance
          return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
          Spree::CaptchaConfiguration.find_or_create_by_name('Captcha configuration')
        end
      end
    end
  end
end

module Spree::Captcha
  class Config < Spree::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        CaptchaConfiguration.find_or_create_by_name("Captcha configuration")
      end
    end
  end
end

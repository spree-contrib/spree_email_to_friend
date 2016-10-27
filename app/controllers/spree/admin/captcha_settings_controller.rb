module Spree
  module Admin
    class CaptchaSettingsController < BaseController
      def update
        params[:preferences].each do |name, value|
          next unless Spree::Captcha::Config.has_preference? name
          Spree::Captcha::Config[name] = value
        end

        respond_to do |format|
          format.html { redirect_to edit_admin_captcha_settings_path }
        end
      end
    end
  end
end

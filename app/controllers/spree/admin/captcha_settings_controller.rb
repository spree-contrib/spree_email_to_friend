module Spree
  module Admin
    class CaptchaSettingsController < BaseController
      def update
        params[:preferences].each do |key, value|
          Spree::Captcha::Config.set_preference(key, value)
        end

        respond_to do |format|
          format.html { redirect_to edit_admin_captcha_settings_path }
        end
      end
    end
  end
end

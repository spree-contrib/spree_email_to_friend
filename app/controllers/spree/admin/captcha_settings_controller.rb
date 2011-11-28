module Spree
  module Admin
    class CaptchaSettingsController < BaseController
      def update
        Spree::Captcha::Config.set(params[:preferences])

        respond_to do |format|
          format.html {
            redirect_to admin_captcha_settings_path
          }
        end
      end
    end
  end
end

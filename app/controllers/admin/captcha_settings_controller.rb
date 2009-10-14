class Admin::CaptchaSettingsController < Admin::BaseController
  def update
    Spree::Captcha::Config.set(params[:preferences])

    respond_to do |format|
      format.html {
        redirect_to admin_captcha_settings_path
      }
    end
  end
end

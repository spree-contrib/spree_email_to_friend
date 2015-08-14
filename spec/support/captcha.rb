RSpec.configure do |config|

  Recaptcha.configuration.skip_verify_env.delete("test")

  config.before do
    # reset captcha config
    Spree::Captcha::Config.set(Spree::Captcha::Config.default_preferences)
  end
end

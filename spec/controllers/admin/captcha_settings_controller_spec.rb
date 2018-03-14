RSpec.describe Spree::Admin::CaptchaSettingsController, type: :controller do
  stub_authorization!

  before do
    user = create(:admin_user)
    allow(controller).to receive(:try_spree_current_user) { user }
  end

  context '#update' do
    it 'redirects to edit captcha settings page' do
      spree_put :update, preferences: { theme: 'white' }
      expect(response).to redirect_to spree.edit_admin_captcha_settings_path
    end

    context 'For parameters:
            theme: clean,
            secret_key: FAKE,
            site_key: FAKE,
            use_captcha: false' do
      it 'sets preferred_theme to clean' do
        spree_put :update, preferences: { theme: 'clean' }
        expect(Spree::Captcha::Config.preferred_theme).to eq 'clean'
      end

      it 'sets preferred_secret_key to FAKE' do
        spree_put :update, preferences: { secret_key: 'FAKE' }
        expect(Spree::Captcha::Config.preferred_secret_key).to eq 'FAKE'
      end

      it 'sets preferred_secret_key to FAKE' do
        spree_put :update, preferences: { secret_key: 'FAKE' }
        expect(Spree::Captcha::Config.preferred_secret_key).to eq 'FAKE'
      end

      it 'sets preferred_use_captcha to false' do
        spree_put :update, preferences: { use_captcha: false }
        expect(Spree::Captcha::Config.preferred_use_captcha).to be false
      end
    end
  end

  context '#edit' do
    it 'renders the edit template' do
      spree_get :edit
      expect(response).to render_template(:edit)
    end
  end
end

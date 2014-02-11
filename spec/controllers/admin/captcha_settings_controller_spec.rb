require 'spec_helper'

describe Spree::Admin::CaptchaSettingsController do
  stub_authorization!

  before do
    user = create(:admin_user)
    controller.stub(try_spree_current_user: user)
  end

  context '#update' do
    it 'redirects to edit captcha settings page' do
      spree_put :update, preferences: { theme: 'white' }
      expect(response).to redirect_to spree.edit_admin_captcha_settings_path
    end

    context 'For parameters:
            theme: clean,
            private_key: FAKE,
            public_key: FAKE,
            use_captcha: false' do

      it 'sets preferred_theme to clean' do
        spree_put :update, preferences: { theme: 'clean' }
        expect(Spree::Captcha::Config.preferred_theme).to eq 'clean'
      end

      it 'sets preferred_private_key to FAKE' do
        spree_put :update, preferences: { private_key: 'FAKE' }
        expect(Spree::Captcha::Config.preferred_private_key).to eq 'FAKE'
      end

      it 'sets preferred_public_key to FAKE' do
        spree_put :update, preferences: { public_key: 'FAKE' }
        expect(Spree::Captcha::Config.preferred_public_key).to eq 'FAKE'
      end

      it 'sets preferred_use_captcha to false' do
        spree_put :update, preferences: { use_captcha: false }
        expect(Spree::Captcha::Config.preferred_use_captcha).to be_false
      end
    end
  end

  context '#edit' do
    it 'render the edit template' do
      spree_get :edit
      expect(response).to render_template(:edit)
    end
  end
end
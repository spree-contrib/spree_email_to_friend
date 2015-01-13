RSpec.feature 'Admin Captcha Settings', :js do
  stub_authorization!

  context 'when update' do
    background 'visits admin pannel' do
      visit spree.edit_admin_captcha_settings_path
    end

    scenario 'display Captcha Settings on front end' do
      expect(page).to have_text 'Captcha Settings'
      choose 'Yes'
      click_button 'Update'
      expect(find_field('Yes').value).not_to be_blank
    end

    scenario 'does not display Captcha Settings on frontend' do
      choose 'No'
      click_button 'Update'
      expect(find_field('No').value).not_to be_blank
    end
  end
end

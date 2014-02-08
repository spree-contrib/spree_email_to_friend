require 'spec_helper'

feature 'Admin Captcha Settings', js: true do
  stub_authorization!

  context 'when update' do
    background 'should visit admin pannel' do
      visit spree.admin_path
      click_link 'Configuration'
    end

    scenario 'display Captcha Settings on front end' do
      expect(page).to have_text 'Captcha Settings'.upcase
      click_link 'Captcha Settings'
      choose 'Yes'
      click_button 'Update'
      expect(find_field('Yes').value).not_to be_blank
    end

    scenario 'dont display Captcha Settings on frontend' do
      click_link 'Captcha Settings'
      choose 'No'
      click_button 'Update'
      expect(find_field('No').value).not_to be_blank
    end
  end
end
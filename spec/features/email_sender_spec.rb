RSpec.feature 'Email to friend', :js, type: :feature do

  given(:product) { create(:product) }
  given(:mail)    { build(:mail) }

  background do
    visit spree.product_path(product)
    expect(page).to have_text product.name
    expect(page).to have_link 'Email a friend'
    click_link 'Email a friend'
  end

  scenario 'throw error on empty form submission' do
    click_button 'Tell your friend!'
    expect(page).to have_text 'There were problems with the following fields:'
  end

  context 'without captcha' do
    background do
      Spree::Captcha::Config.use_captcha = false
    end

    scenario 'even a robot can send email to friend' do
      fill_in_form_with mail
      click_button 'Tell your friend!'
      expect(page).to have_text "Mail sent to #{mail.recipients.first}"
    end
  end

  context 'with captcha' do
    background do
      Spree::Captcha::Config.use_captcha = true
    end

    scenario 'only human can send email to friend' do
      fill_in_form_with mail
      click_button 'Tell your friend!'
      pending 'It bypass captcha..'
      expect(page).not_to have_text "Mail sent to #{mail.recipients.first}"
    end
  end

  private

  def fill_in_form_with(mail)
    fill_in 'mail_to_friend_sender_name', with: mail.sender_name
    fill_in 'mail_to_friend_sender_email', with: mail.sender_email
    fill_in 'mail_to_friend_recipient_name', with: mail.recipient_name
    fill_in 'mail_to_friend_recipient_email', with: mail.recipients.first
    fill_in 'mail_to_friend_message', with: mail.message
  end
end

RSpec.describe Spree::ToFriendMailer, type: :mailer do
  let!(:product) { create(:product) }

  context 'mail content' do
    let(:mail_object) { build(:mail) }
    let(:email)       { Spree::ToFriendMailer.mail_to_friend(product, mail_object) }

    it 'is reply to the sender email' do
      expect(email).to reply_to(mail_object.sender_email)
    end

    it 'is delivered to the recipients' do
      expect(email).to deliver_to(mail_object.recipients)
    end

    it 'have the correct subject' do
      expect(email).to have_subject(mail_object.subject)
    end

    it 'contain the sender name in the mail body' do
      expect(email).to have_body_text(mail_object.sender_name)
    end

    it 'contain the users message in the mail body' do
      expect(email).to have_body_text(mail_object.message)
    end

    it 'contain the product name in the mail body' do
      expect(email).to have_body_text(product.name)
    end

    it 'contain a link to the product' do
      expect(email).to have_body_text(spree.product_path(product))
    end
  end
end

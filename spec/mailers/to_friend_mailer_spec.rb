require 'spec_helper'

describe Spree::ToFriendMailer do
  let!(:product) { create(:product) }

  context 'mail content' do
    let(:mail_object) { build(:mail, hide_recipients: true) }
    let(:email)       { Spree::ToFriendMailer.mail_to_friend(product, mail_object) }

    it 'is reply to the sender email' do
      expect(email).to reply_to(mail_object.sender_email)
    end

    it 'is delivered to the recipient email' do
      expect(email).to deliver_to(mail_object.recipients.first)
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

  describe 'using hide recipients option' do
    context 'when true' do
      let(:mail_object) { build(:mail, recipients: ["sue@yahoo.com", "bill@yahoo.com", "john@yahoo.com"], hide_recipients: true) }
      let(:email)       { Spree::ToFriendMailer.mail_to_friend(product, mail_object) }

      it 'include them in bcc' do
        expect(email).to reply_to(mail_object.sender_email)
        expect(email).to deliver_to('sue@yahoo.com')
        expect(email).to bcc_to('bill@yahoo.com', 'john@yahoo.com')
      end
    end

    context 'when false' do
      let(:mail_object) { build(:mail, recipients: ["sue@yahoo.com", "bill@yahoo.com"], hide_recipients: false) }
      let(:email)       { Spree::ToFriendMailer.mail_to_friend(product, mail_object) }

      it 'should not include bcc' do
        expect(email).to reply_to(mail_object.sender_email)
        expect(email).to deliver_to('sue@yahoo.com', 'bill@yahoo.com')
        expect(email).to bcc_to([])
      end
    end
  end
end

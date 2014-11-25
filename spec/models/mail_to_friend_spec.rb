require 'spec_helper'

describe Spree::MailToFriend do
  it { should validate_presence_of :subject }
  it { should validate_presence_of :sender_name }
  it { should validate_presence_of :recipient_name }

  context 'Validate required fields' do
    it 'verify test data hase been generated' do
      expect(build(:mail)).to be_valid
    end
  end

  context 'invalid recipents should be removed' do
    let(:mail) do
      build(:mail, invalid_recipients: ['invaild'])
    end

    it 'check email format with REGEX' do
      expect(mail).not_to be_valid
    end

    it 'persist function should return false' do
      mail_to_friend = Spree::MailToFriend.new
      expect(mail_to_friend.persisted?).to be false
    end
  end
end

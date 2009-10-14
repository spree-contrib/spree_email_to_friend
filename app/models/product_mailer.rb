class ProductMailer < ActionMailer::Base
  default_url_options[:host] = Spree::Config[:site_url]

  def mail_to_friend(product, mail)
    subject       I18n.t('email_to_friend.you_would_like_this')
    from          Spree::Config[:mails_from]
    reply_to      mail.sender_email
    recipients    mail.recipient_email
    sent_on       Time.now
    body          :product => product, :mail => mail
  end
end

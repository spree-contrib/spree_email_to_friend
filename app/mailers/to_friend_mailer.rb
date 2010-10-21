class ToFriendMailer < ActionMailer::Base
  default_url_options[:host] = Spree::Config[:site_url]
  default :from => Spree::Config[:mails_from]

  def mail_to_friend(object, mail)
    subject = I18n.t('email_to_friend.you_would_like_this')       
    @object = object
    @mail = mail
    mail(:to => mail.recipient_email, :subject => subject, 
         :reply_to => mail.sender_email)
  end
end

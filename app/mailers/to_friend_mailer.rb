class ToFriendMailer < ActionMailer::Base
  default_url_options[:host] = Spree::Config[:site_url]
  default :from => Spree::Config[:mails_from]

  def mail_to_friend(object, mail)
    @object = object
    @mail = mail
    mail(:to => mail.recipient_email, :subject => mail.subject,
         :reply_to => mail.sender_email)
  end
end

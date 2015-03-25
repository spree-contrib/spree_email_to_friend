class Spree::ToFriendMailer < ActionMailer::Base
  default from: Spree::Store.current.mail_from_address || ''

  def mail_to_friend(object, mail)
    @object = object
    @mail = mail
    opts = {}

    opts[:to] = mail.recipients
    default_url_options[:host] = mail.host
    opts[:subject] =  mail.subject
    opts[:reply_to] = mail.sender_email

    mail(opts)
  end
end

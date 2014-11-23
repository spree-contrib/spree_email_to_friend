class Spree::ToFriendMailer < ActionMailer::Base
  default :from => Spree::Config[:mails_from] || ''


  def mail_to_friend(object, mail)
    @object = object
    @mail = mail
    opts = {}

    if mail.hide_recipients
      opts[:to]  = mail.recipients.first
      opts[:bcc] = mail.recipients[1..-1] if mail.recipients.size > 1
    else
      opts[:to] = mail.recipients
    end
    default_url_options[:host] = mail.host
    opts[:subject] =  mail.subject
    opts[:reply_to] = mail.sender_email

    mail(opts)
  end
end

class Spree::ToFriendMailer < ActionMailer::Base
  default :from => Spree::Config[:mails_from] || ''


  def mail_to_friend(object, mail)
    @object = object
    @mail = mail
    opts = {}

    if mail.hide_recipients
      opts[:to]  = mail.recipient_email
      opts[:bcc] = mail.recipients
    else
      opts[:to] = [mail.recipient_email, mail.recipients.to_s.split(',')].flatten
    end
    default_url_options[:host] = mail.host
    opts[:subject] =  mail.subject
    opts[:reply_to] = mail.sender_email

    mail(opts)
  end
end

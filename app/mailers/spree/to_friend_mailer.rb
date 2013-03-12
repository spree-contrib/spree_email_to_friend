class Spree::ToFriendMailer < ActionMailer::Base
  default :from => Spree::MailMethod.current.try(:preferred_mails_from) || ''

  def mail_to_friend(object, mail)
    @object = object
    @mail = mail
    opts = {}

    if mail.hide_recipients && Spree::Config[:hidden_recipients_to_address]
      opts[:to] = Spree::Config[:hidden_recipients_to_address]
      opts[:bcc] = mail.recipient_email
    else
      opts[:to] = mail.recipient_email
    end
    default_url_options[:host] = mail.host
    opts[:subject] =  mail.subject
    opts[:reply_to] = mail.sender_email

    mail(opts)
  end
  
  def mail_to_cloud(object, mail)
    @object = object
    @mail = mail
    opts = {}

    if mail.hide_recipients && Spree::Config[:hidden_recipients_to_address]
      opts[:to] = Spree::Config[:hidden_recipients_to_address]
      opts[:bcc] = mail.recipient_email
    else
      opts[:to] = mail.recipient_email
    end
    default_url_options[:host] = mail.host
    opts[:subject] =  mail.subject
    opts[:reply_to] = mail.sender_email

    mail(opts)
  end
end

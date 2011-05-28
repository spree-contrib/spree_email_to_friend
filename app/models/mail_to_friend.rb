class MailToFriend
  include ActiveModel::Validations
  include ActiveModel::Conversion
  attr_accessor :host, :subject, :sender_name, :sender_email, :recipient_name, :recipient_email, :message, :recipients, :invalid_recipients, :hide_recipients

  EMAILREGEX = /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,8}$/i

  validates :subject, :presence => true
  validates :sender_name, :presence => true
  validates :recipient_name, :presence => true, :unless => :is_multi
  validates :sender_email, :format => { :with => EMAILREGEX }
  validates :recipients, :length => {:minimum => 1, :message => "must contain at least one valid email address"}
  validates :invalid_recipients, :length => {:maximum => 0, :message => "must be removed"}

  def initialize(opts = {})
    @subject      = opts[:subject]      || I18n.t('email_to_friend.you_would_like_this')
    @sender_email = opts[:sender_email] || ' '
    @sender_name  = opts[:sender_name]  || @sender_email.split('@', 2)[0].titleize

    @recipients = []
    @invalid_recipients = []

    @recipient_email = (opts[:recipient_email] || '').gsub(';', ',').gsub(/\s/ , '')
    @recipient_email.split(',').each do |address|
      if address =~ EMAILREGEX
         @recipients << address
      else
        @invalid_recipients << address
      end
    end

    @recipient_name = opts[:recipient_name]
    @recipient_name ||= @recipients[0].split('@', 2)[0].titleize unless @recipients.empty?

    @hide_recipients = opts[:hide_recipients] || false
    @message = opts[:message]
  end

  def persisted?
    false
  end

  def is_multi
    (@recipients.size + @invalid_recipients.size) > 1
  end
end

class MailToFriend
  include ActiveModel::Validations
  include ActiveModel::Conversion
  attr_accessor :sender_name, :sender_email, :recipient_name, :recipient_email, :message

  validates :sender_name, :presence => true
  validates :recipient_name, :presence => true
  validates :sender_email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,8}$/i }
  validates :recipient_email, :format => { :with => /^([-a-z0-9_+\.]+\@[-a-z0-9]+\.+[a-z0-9]{2,8}[,;]*)+$/i , :message => "contains invalid email address" }

  def initialize(opts = {})
    @sender_email = opts[:sender_email] || ' '
    @sender_name  = opts[:sender_name]  || @sender_email.split('@', 2)[0].titleize
    @recipient_email = (opts[:recipient_email] || ' ').gsub(';', ',').gsub(/\s/ , "")
    @recipient_name = opts[:recipient_name] || @recipient_email.split('@', 2)[0].titleize
    @message = opts[:message]
  end

  def persisted?
    false
  end
end

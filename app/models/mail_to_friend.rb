class MailToFriend
  include Validatable

  attr_accessor :sender_name, :sender_email, :recipient_name, :recipient_email, :message

  validates_presence_of :sender_name, :recipient_name
  validates_format_of :sender_email, :recipient_email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i

  def initialize(opts = {})
    @sender_name = opts[:sender_name]
    @sender_email = opts[:sender_email]
    @recipient_name = opts[:recipient_name]
    @recipient_email = opts[:recipient_email]
    @message = opts[:message]
  end
end

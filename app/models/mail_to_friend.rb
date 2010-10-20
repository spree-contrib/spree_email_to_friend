class MailToFriend
  include ActiveModel::Validations
  include ActiveModel::Conversion
  attr_accessor :sender_name, :sender_email, :recipient_name, :recipient_email, :message

  validates :sender_name, :presence => true
  validates :recipient_name, :presence => true
  validates :sender_email, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i }
  validates :recipient_email, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i }

  def initialize(opts = {})
    @sender_name = opts[:sender_name]
    @sender_email = opts[:sender_email]
    @recipient_name = opts[:recipient_name]
    @recipient_email = opts[:recipient_email]
    @message = opts[:message]
  end
  
  def persisted?
    false
  end
end

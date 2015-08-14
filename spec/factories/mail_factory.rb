FactoryGirl.define do
  factory :mail, class: Spree::MailToFriend do
    host               'localhost'
    sender_name        { FFaker::Name.name }
    sender_email       { FFaker::Internet.email(sender_name) }
    recipient_name     { FFaker::Name.name }
    recipient_email    { FFaker::Internet.email(recipient_name) }

    subject            'Check this out!'
    message            'Its totally awesome..'

    recipients         { Array(1..4).sample.times.map { FFaker::Internet.email } }
    invalid_recipients []
  end
end

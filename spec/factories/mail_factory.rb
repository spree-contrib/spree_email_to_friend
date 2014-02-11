FactoryGirl.define do
  factory :mail, class: Spree::MailToFriend do
    host               'localhost'
    sender_name        { Faker::Name.name }
    sender_email       { Faker::Internet.email(sender_name) }
    recipient_name     { Faker::Name.name }
    recipient_email    { Faker::Internet.email(recipient_name) }

    subject            'Check this out!'
    message            'Its totally awesome..'

    recipients         { Array(1..4).sample.times.map{ Faker::Internet.email }.join(',') }
    hide_recipients    { [true,false].sample }
    invalid_recipients nil
  end
end
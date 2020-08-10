FactoryBot.define do
  factory :mailer_box do
    price { "9.99" }
    type { "MailerBox" }
    quantity { rand(MailerBox::MIN_QUANTITY..MailerBox::MAX_QUANTITY) }
    offer
  end
end

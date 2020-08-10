FactoryBot.define do
  factory :poly_mailer do
    price { "9.99" }
    type { "PolyMailer" }
    quantity { rand(PolyMailer::MIN_QUANTITY..PolyMailer::MAX_QUANTITY) }
    offer
  end
end

FactoryBot.define do
  factory :product_attribute do
    name { "MyString" }
    value { "MyString" }
    data_type { "string" }
    product { create([:poly_mailer, :mailer_box].sample) }
  end
  
  trait :height do
    data_type { "integer" }
    name { "height" }
    value { rand(0..200).to_s }
  end
  
  trait :width do
    data_type { "integer" }
    name { "width" }
    value { rand(0..200).to_s }
  end
  
  trait :length do
    data_type { "integer" }
    name { "length" }
    value { rand(0..200).to_s }
  end
  
  trait :material do
    data_type { "enum" }
    name { "material" }
    value { PolyMailer::MATERIAL_TYPES.sample }
  end
end

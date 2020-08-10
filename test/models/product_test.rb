require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "specialized products should appear in product table" do
    FactoryBot.create(:poly_mailer)
    FactoryBot.create(:mailer_box)
    assert_equal 2, Product.count
  end
  
  test "quantity validation" do
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:poly_mailer, quantity: PolyMailer::MAX_QUANTITY + 25)
    end
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:poly_mailer, quantity: PolyMailer::MIN_QUANTITY - 25)
    end
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:mailer_box, quantity: MailerBox::MAX_QUANTITY + 25)
    end
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:mailer_box, quantity: MailerBox::MIN_QUANTITY - 25)
    end
  end
  
  test "initialize type" do
    mailer = PolyMailer.create
    assert_equal "PolyMailer", mailer.type
    mailer = MailerBox.create
    assert_equal "MailerBox", mailer.type
  end
  
  test "product attribute getters" do
    attribute = FactoryBot.create(:product_attribute, :height)
    assert_equal attribute.value.to_i, attribute.product.height
  end
  
  test "price calculation" do
    product = FactoryBot.create(:poly_mailer, quantity: 50)
    FactoryBot.create(:product_attribute, :height, value: "50", product: product)
    FactoryBot.create(:product_attribute, :width, value: "50", product: product)
    FactoryBot.create(:product_attribute, :material, value: "transparent", product: product)
    assert_equal 1250, product.price.to_i
  end
end

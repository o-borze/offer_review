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
end

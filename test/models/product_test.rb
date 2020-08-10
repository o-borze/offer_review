require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "specialized products should appear in product table" do
    FactoryBot.create(:poly_mailer)
    FactoryBot.create(:mailer_box)
    assert_equal 2, Product.count
  end
end

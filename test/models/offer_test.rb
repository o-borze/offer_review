require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  test "salesman-client association" do
    offer = FactoryBot.create(:offer)
    assert_equal "salesman", offer.salesman.role
    assert_equal "client", offer.client.role
  end
  
  test "salesman validation" do
    user = FactoryBot.create(:user, :admin)
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:offer, salesman: user)
    end
  end
  
  test "client validation" do
    user = FactoryBot.create(:user, :admin)
    assert_raise ActiveRecord::RecordInvalid do
      FactoryBot.create(:offer, client: user)
    end
  end
end

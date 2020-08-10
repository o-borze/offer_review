class ProductAttribute < ApplicationRecord
  belongs_to :product
  after_commit :update_product_price
  
  def maybe_update_product_price
    product.set_price
  end
end

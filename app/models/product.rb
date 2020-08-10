class Product < ApplicationRecord
  belongs_to :offer
  has_many :product_attributes
  
  attribute :type, :string, default: -> { self.class.name }
    
  validate :is_quantity_in_range?
  
  def get_min_quantity
    self.class::MIN_QUANTITY
  end
  
  def get_max_quantity
    self.class::MAX_QUANTITY
  end
  
  def is_quantity_in_range?
    unless (get_min_quantity..get_max_quantity).include?(quantity)
      errors.add(:quantity, "must be between #{get_min_quantity} and #{get_max_quantity}")
    end
  end
  
  def set_price
    return unless all_product_attributes_present?
    self.price = calculate_price
    self.save
  end
  
  def all_product_attributes_present?
    self.class::ALL_PRODUCT_ATTRIBUTES.all?{|product_attr_name| send(product_attr_name) }
  end
end

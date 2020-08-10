class Product < ApplicationRecord
  belongs_to :offer
  
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
end

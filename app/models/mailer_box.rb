class MailerBox < Product
  MIN_QUANTITY = 200
  MAX_QUANTITY = 1000
  
  def height
    product_attributes.find_by(name: "height").value.to_i
  end
  
  def width
    product_attributes.find_by(name: "width").value.to_i
  end
  
  def length
    product_attributes.find_by(name: "length").value.to_i
  end
  
  def calculate_price
    (width + height + length) * 0.1 * quantity
  end
end

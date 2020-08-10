class PolyMailer < Product
  MIN_QUANTITY = 50
  MAX_QUANTITY = 2000
  MATERIAL_TYPES = ['black', 'transparent']
  
  def height
    product_attributes.find_by(name: "height").value.to_i
  end
  
  def width
    product_attributes.find_by(name: "width").value.to_i
  end
  
  def material
    product_attributes.find_by(name: "material").value
  end

  def material_coefficient
    material == "transparent" ? 0.25 : 0.1
  end
  
  def calculate_price
    (width + height) * material_coefficient * quantity
  end
  
end

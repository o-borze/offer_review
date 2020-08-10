class Offer < ApplicationRecord
  enum offer: [:pending, :accepted, :rejected]
  belongs_to :salesman, class_name: 'User', foreign_key: :salesman_id
  belongs_to :client, class_name: 'User', foreign_key: :client_id
  
  validates_presence_of :salesman, :client

  validate :verify_salesman
  validate :verify_client
  
  def verify_salesman
    unless self.salesman.role == "salesman"
      errors.add(:salesman, "Must be a salesman user")
    end
  end
  
  def verify_client
    unless self.client.role == "client"
      errors.add(:client, "Must be a client user")
    end
  end
end

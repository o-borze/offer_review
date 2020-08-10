class User < ApplicationRecord
  enum role: [:admin, :salesman, :client]
  has_many :offers
end

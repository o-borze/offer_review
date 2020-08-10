class User < ApplicationRecord
  enum role: [:admin, :salesman, :client]
end

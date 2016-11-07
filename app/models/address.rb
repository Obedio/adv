class Address < ApplicationRecord
  belongs_to :addresstype
  has_one :client
end

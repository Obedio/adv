class Address < ApplicationRecord
  has_one :client
  validates :street, :district, :zipcode, :city, :state, :country, :addresstype, presence: true
end

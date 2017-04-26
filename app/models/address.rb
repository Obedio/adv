class Address < ApplicationRecord
  belongs_to :client
  validates :street, :district, :zipcode, :city, :state, :country, :addresstype, presence: true
end

class Address < ApplicationRecord
  belongs_to :client
  validates :street, :district, :zipcode, :city, :state, :addresstype, presence: true
end

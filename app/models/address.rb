class Address < ApplicationRecord
  has_one :client
  #validates :client, presence: true
  #validates :street, :district, :city, :state, :country, :addresstype, presence: true, 
  #format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  #validates :zipcode, presence: true

end

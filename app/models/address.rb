class Address < ApplicationRecord
  belongs_to :addresstype
  has_one :client
  validates :addresstype, presence: true
  validates :street, :district, :city, :state, :country, presence: true, 
  format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  validates :zipcode, presence: true

end

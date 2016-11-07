class AddressType < ApplicationRecord
	has_many :addresses
	validates :name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end

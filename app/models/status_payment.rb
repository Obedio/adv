class StatusPayment < ApplicationRecord
	has_many :accounts
	validates :name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/, 
  	message: "only allows letters" }
end

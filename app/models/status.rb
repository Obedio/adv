class Status < ApplicationRecord 
	has_many :lawsuits
	validates :name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end

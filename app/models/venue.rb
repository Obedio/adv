class Venue < ApplicationRecord
	has_many :lawsuits
	validates :name, :city, presence: true
end

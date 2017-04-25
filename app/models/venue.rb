class Venue < ApplicationRecord
	has_many :lawsuits
	validates :name, presence: true
end

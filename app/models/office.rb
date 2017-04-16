class Office < ApplicationRecord
	has_many :profiles
	validates :name, uniqueness: true, presence: true
end

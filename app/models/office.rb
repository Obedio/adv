class Office < ApplicationRecord
	has_many :datausers
	validates :name, uniqueness: true, presence: true
end

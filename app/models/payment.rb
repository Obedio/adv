class Payment < ApplicationRecord
  belongs_to :account
  validates :account, :amount, presence: true
  validates :amount, numericality: true
end

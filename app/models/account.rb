class Account < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :client
  belongs_to :user
  belongs_to :statuspayment
  has_many :payments
  validates :lawsuit, :client, :statuspayment, :user, presence: true
  validates :amount, :amount_paid, numericality: true, presence: true
  validates :payday, presence: true, numericality: { only_integer: true }
end

class Lawsuit < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :venue
  belongs_to :kind
  belongs_to :status
  has_many :comments
  has_one :account
  validates :user, :venue, :kind, :client, :status,
  :number, :assessment, :description, :amount, presence: true
  #validates :assessment, date: true
  validates :amount, numericality: true

end

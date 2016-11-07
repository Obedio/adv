class Client < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :lawsuits
  has_many :accounts
end

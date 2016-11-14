class Lawsuit < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :venue
  belongs_to :kind
  belongs_to :status
  has_many :comments
end

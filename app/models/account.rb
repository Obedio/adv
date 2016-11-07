class Account < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :client
  belongs_to :user
  belongs_to :statuspayment
  has_many :payments
end

class DataUser < ApplicationRecord
  belongs_to :office
  belongs_to :user
  validates :office, :user, :name, :born, :sex, presence: true
  validates :name, :sex, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end

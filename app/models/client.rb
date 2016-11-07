class Client < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :lawsuits
  has_many :accounts
  validates :cpf, :rg, uniqueness: true, presence: true, numericality: { only_integer: true }
  validates :name, :born, :sex, :email, :telephone, :celphone, :address, :user, presence: true
  validates :name, :sex, :bio, format: { with: /\A[a-zA-Z]+\z/, 
  	message: "only allows letters" }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
  on: :create }
end

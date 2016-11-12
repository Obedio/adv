class Client < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :lawsuits
  has_many :accounts
  validates :cpf, :rg, uniqueness: true, presence: true, numericality: { only_integer: true }
  validates :name, :born, :sex, :email, :telephone, :celphone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
  on: :create }

  accepts_nested_attributes_for :address
end

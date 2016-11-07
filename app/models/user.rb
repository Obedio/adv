class User < ApplicationRecord
  has_many :clients
  has_one :datauser
  has_many :lawsuits
  has_many :comments
  has_many :accounts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

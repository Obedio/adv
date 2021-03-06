class User < ApplicationRecord
	enum role: [:normal_user, :admin]
  has_many :clients
  has_many :annexes
  has_one :profile
  has_many :lawsuits
  has_many :observations
  has_many :accounts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

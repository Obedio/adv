class DataUser < ApplicationRecord
  belongs_to :office
  belongs_to :user
  validates :office, :user, :name, :born, :sex, presence: true
end

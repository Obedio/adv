class Comment < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :user
  validates :lawsuit, :user, :description, presence: true
end

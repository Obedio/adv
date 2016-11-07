class Comment < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :user
end

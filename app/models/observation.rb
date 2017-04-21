class Observation < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :user
end

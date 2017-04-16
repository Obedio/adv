class Annex < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :user
  mount_uploader :document, AnnexUploader
end

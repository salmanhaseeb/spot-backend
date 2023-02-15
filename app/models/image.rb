class Image < ApplicationRecord
  # association with spot
  belongs_to :spot
  # for image attached
  has_one_attached :file
end

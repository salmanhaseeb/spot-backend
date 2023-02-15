class Review < ApplicationRecord
  # association with spot
  belongs_to :spot
  # validate for Review fields must be Present
  validates_presence_of :reviewer_name, :star
end

class Spot < ApplicationRecord
  # has many association for images and reviews
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # validate for Spot fields must be Present
  validates_presence_of :title, :description, :price

  # for create, update and delete images with the spots on the time of spot create update and delete
  accepts_nested_attributes_for :images, allow_destroy: true

  # calculate average of reviews star on spot
  def reviews_average
    self.reviews.pluck(:star).sum / self.reviews.count if self.reviews.present?
  end
end

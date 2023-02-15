require "swagger_helper"

RSpec.describe Review, type: :model do
  let(:review) { FactoryBot.create(:review) }
  before do
    5.times do
      FactoryBot.create(:review)
    end
  end
  it "creates new Review" do
    @spot = FactoryBot.create(:spot)
    review = Review.new(
      spot_id: @spot.id,
      reviewer_name: "test User",
      comment: "Such a beautiful Ocean View",
      star: 5  )
    expect(review).to be_valid
  end

  it "not valid" do
    review = Review.new(
      reviewer_name: "test User",
      comment: "Such a beautiful Ocean View",
      star: 5  )
    expect(review).to_not be_valid
  end
end

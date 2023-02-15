require 'rails_helper'

RSpec.describe Spot, type: :model do
  let(:spot) { FactoryBot.create(:spot) }
  before do
    5.times do
      FactoryBot.create(:spot)
    end
  end
  it "creates new Spot" do
    spot = Spot.new(title: "Test Title",
      description: "Test description for this spot.",
      price: 525.25 )
    expect(spot).to be_valid
  end

  it "not valid" do
    spot = Spot.new(title: "Test Title",
      description: "Test description for this spot." )
    expect(spot).to_not be_valid
  end
end

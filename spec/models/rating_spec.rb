# validates :points, numericality: { greater_than_or_equal_to: 1,
#less_than_or_equal_to: 5,
 #   only_integer: true }

require 'rails_helper'

RSpec.describe Place, type: :model do

  describe 'can be saved when points' do

    it "isn't over the maximum possible value" do
      rating = Rating.create points:5

      expect(rating.valid?).to be true
      expect(Rating.count).to eq(1)
    end

    it "is just big enough" do
      rating = Rating.create points:1

      expect(rating.valid?).to be true
      expect(Rating.count).to eq(1)
    end
  end

  describe "can't be saved when points" do

    it 'is too big a value' do
      rating = Rating.create points:6

      expect(rating.valid?).to be false
      expect(Rating.count).to eq(0)
    end

    it 'is too small a value' do
      rating = Rating.create points:0

      expect(rating.valid?).to be false
      expect(Rating.count).to eq(0)
    end
  end
end

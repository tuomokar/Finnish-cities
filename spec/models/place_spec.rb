require 'rails_helper'

RSpec.describe Place, type: :model do

  describe 'can be saved when name' do

    it 'is valid' do
      restaurant = Restaurant.create name:'Awesome place'

      expect(restaurant.valid?).to be true
      expect(Place.count).to eq(1)
    end

    it "is valid and just long enough" do
      restaurant = Restaurant.create name:'Aw'

      expect(restaurant.valid?).to be true
      expect(Place.count).to eq(1)
    end

  end

  describe "does not get saved when name is" do

    it 'empty' do
      restaurant = Restaurant.create name:''

      expect(restaurant.valid?).to be false
      expect(Place.count).to eq(0)
    end

    it 'not long enough' do
      restaurant = Restaurant.create name:'a'

      expect(restaurant.valid?).to be false
      expect(Place.count).to eq(0)
    end
  end

  describe "average rating" do

    it "returns 0 when there are no ratings" do
      restaurant = Restaurant.create name:"Awesome place"

      expect(restaurant.average_rating).to eq(0)
    end

    it "returns the only rating's value if there is only one" do
      rating = Rating.create points:3
      restaurant = Restaurant.create name:"Awesome place"

      restaurant.ratings << rating

      expect(restaurant.average_rating).to eq(3)
    end

    it "returns the average correctly when there are is more than one rating" do
      rating1 = Rating.create points:3
      rating2 = Rating.create points:4
      rating3 = Rating.create points:5

      restaurant = Restaurant.create name:"Awesome place"

      restaurant.ratings << rating1
      restaurant.ratings << rating2
      restaurant.ratings << rating3

      expect(restaurant.average_rating).to eq(4)
    end
  end
end

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

  describe "top restaurants" do
    it "returns an empty array when there are no rated restaurants" do
      empty_restaurants = Restaurant.top_rated

      expect(empty_restaurants).to be_empty
    end

    it "returns only one restaurant when there is only one rated restaurant" do
      expect(Restaurant.top_rated.count).to eq(0)

      create_rated_restaurants(["res1"])

      expect(Restaurant.top_rated.count).to eq(1)
    end

    it "returns all the restaurants when there are 3 restaurants" do
      create_rated_restaurants(["res1", "res2", "res3"])

      expect(Restaurant.top_rated.count).to eq(3)
    end

    it "returns the best rated 3 restaurants when there are many rated restaurants" do
      create_rated_restaurants(["res1", "res2", "res3", "res4", "res5", "res6", "res7"])

      rating = Rating.create points:4
      extra_restaurant = Restaurant.create name:"Extra"
      extra_restaurant.ratings << rating

      expect(Restaurant.top_rated.count).to eq(3)
      expect(Restaurant.top_rated.first.name).to eq('res5')
      expect(Restaurant.top_rated.second.name).to eq('res4')
      expect(Restaurant.top_rated.third.name).to eq("Extra")
    end

    it "returns only rated restaurants, not unrated ones" do
      create_rated_restaurants(["res1", "res2"])

      Restaurant.create name:"unrated1"
      Restaurant.create name:"unrated"

      expect(Restaurant.top_rated.count).to eq(2)
    end

    it "returns only restaurants, not other kind of places" do
      create_rated_restaurants(["res1", "res2"])

      rating = Rating.create points:4
      place = Place.create name:"place"
      place.ratings << rating

      expect(Restaurant.top_rated.count).to eq(2)
    end

    it "returns a rated restaurant only once" do
      rating = Rating.create points:4
      rating2 = Rating.create points:5

      restaurant = Restaurant.create name:"restaurant"
      restaurant.ratings << rating
      restaurant.ratings << rating2

      expect(Restaurant.top_rated.count).to eq(1)
    end
  end

  describe "top breweries" do

    it "returns an empty array when there are no rated breweries" do
      empty_breweries = Brewery.top_rated

      expect(empty_breweries).to be_empty
    end

    it "returns only one brewery when there is only one rated brewery" do
      expect(Brewery.top_rated.count).to eq(0)

      create_rated_breweries(["brew1"])

      expect(Brewery.top_rated.count).to eq(1)
    end

    it "returns all the breweries when there are 3 breweries" do
      create_rated_breweries(["brew1", "brew2", "brew3"])

      expect(Brewery.top_rated.count).to eq(3)
    end

    it "returns the best rated 3 breweries when there are many rated breweries" do
      create_rated_breweries(["brew1", "brew2", "brew3", "brew4", "brew5", "brew6", "brew7"])

      rating = Rating.create points:4
      extra_brewery = Brewery.create name:"Extra"
      extra_brewery.ratings << rating

      expect(Brewery.top_rated.count).to eq(3)
      expect(Brewery.top_rated.first.name).to eq('brew5')
      expect(Brewery.top_rated.second.name).to eq('brew4')
      expect(Brewery.top_rated.third.name).to eq("Extra")
    end

    it "returns only rated breweries, not unrated ones" do
      create_rated_breweries(["brew1", "brew2"])

      Brewery.create name:"unrated1"
      Brewery.create name:"unrated"

      expect(Brewery.top_rated.count).to eq(2)
    end

    it "returns only breweries, not other kind of places" do
      create_rated_breweries(["brew1", "brew2"])

      rating = Rating.create points:4
      place = Place.create name:"place"
      place.ratings << rating

      rating2 = Rating.create points:5
      restaurant = Restaurant.create name:"res1"
      restaurant.ratings << rating

      expect(Brewery.top_rated.count).to eq(2)
    end

    it "returns a rated brewery only once" do
      rating = Rating.create points:4
      rating2 = Rating.create points:5

      brewery = Brewery.create name:"brewery"
      brewery.ratings << rating
      brewery.ratings << rating2

      expect(Brewery.top_rated.count).to eq(1)
    end
  end


end

def create_rated_restaurants(names)
  i = 1

  names.each do |name|
    rating = Rating.create points:i
    restaurant = Restaurant.create name:name
    restaurant.ratings << rating

    i += 1
    i = 1 if i == 6
  end
end

def create_rated_breweries(names)
  i = 1

  names.each do |name|
    rating = Rating.create points:i
    brewery = Brewery.create name:name
    brewery.ratings << rating

    i += 1
    i = 1 if i == 6
  end
end
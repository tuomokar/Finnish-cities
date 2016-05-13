require 'rails_helper'

RSpec.describe Municipality, type: :model do


  describe "top ratings" do
    it "is empty when municipality has no places" do
      municipality = Municipality.create name:"Lahti"

      expect(municipality.top_rated.count).to eq(0)
    end

    it "is empty if there are no places that are rated" do
      municipality = Municipality.create name:"Polvijärvi"
      restaurant = Restaurant.create name:"Awesome place"

      municipality.places << restaurant

      expect(municipality.top_rated.count).to eq(0)
    end

    it "returns collection containing the only place if there is only one rated place" do
      municipality = Municipality.create name:"Iisalmi"
      add_rated_places(municipality, ["place1"])

      expect(municipality.top_rated.count).to eq(1)
      expect(municipality.top_rated.first.name).to eq("place1")
    end

    it "returns the only 3 places if there are only 3 rated places" do
      municipality = Municipality.create name:"Kuhmo"
      add_rated_places(municipality, ["place1", "place2", "place3"])

      expect(municipality.top_rated.count).to eq(3)
    end

    it "returns the only rated place ouf of all places when the others are unrated" do
      municipality = Municipality.create name:"Tammisaari"
      add_rated_places(municipality, ["place10"])

      municipality.places << (Restaurant.create name:"no_ratings")
      municipality.places << (Restaurant.create name:"no_ratings2")

      expect(municipality.top_rated.count).to eq(1)
    end

    it "returns the specific municipalities' only rated place and no other municipalities's rated places" do
      municipality1 = Municipality.create name:"Janakkala"
      add_rated_places(municipality1, ["place1"])

      municipality2 = Municipality.create name:"Juupajoki"
      add_rated_places(municipality2, ["place2"])

      expect(municipality1.top_rated.count).to eq(1)
      expect(municipality1.top_rated.first.name).to eq("place1")

      expect(municipality2.top_rated.count).to eq(1)
      expect(municipality2.top_rated.first.name).to eq("place2")
    end

    it "returns the only 3 rated places if there are still more unrated places" do
      municipality = Municipality.create name:"Kannonkoski"
      add_rated_places(municipality, ["place1", "place2", "place3"])

      municipality.places << (Restaurant.create name:"unrated_place1")
      municipality.places << (Restaurant.create name:"unrated_place2")

      expect(municipality.top_rated.count).to eq(3)
    end

    it "returns the 3 best rated places out of all the rated places" do
      municipality = Municipality.create name:"Kauhajoki"
      add_rated_places(municipality, ["place1", "place2", "place3", "place4", "place5"])

      restaurant = Restaurant.create name:"extra_place"
      restaurant.ratings << (Rating.create points:5)
      municipality.places << restaurant

      top_rated = municipality.top_rated

      expect(top_rated.count).to eq(3)
      expect(top_rated.first.name).to eq("place5")
      expect(top_rated.second.name).to eq("extra_place")
      expect(top_rated.third.name).to eq("place4")
    end
  end
end

def add_rated_places(municipality, names)
  points = 1
  names.each do |name|
    restaurant = Restaurant.create name:name
    rating = Rating.create points:points
    restaurant.ratings << rating

    municipality.places << restaurant

    points += 1
    points = 1 if points == 6
  end
end
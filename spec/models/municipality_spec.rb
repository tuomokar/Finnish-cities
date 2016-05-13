require 'rails_helper'

RSpec.describe Municipality, type: :model do


  describe "top ratings" do
    it "is empty when municipality are no places" do
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

      municipality.places.each do |place|
        puts "#{place.name}, of class #{place.class.name}"
      end

      names = ["place1"]
      add_rated_places(municipality, names)

      expect(municipality.top_rated.count).to eq(1)
      expect(municipality.top_rated.first.name).to eq("place1")
    end

    it "returns the only 3 places if there are only 3 rated places" do
      municipality = Municipality.create name:"Kuhmo"

      municipality.places.each do |place|
        puts "#{place.name}, of class #{place.class.name}"
      end

      add_rated_places(municipality, ["place1", "place2", "place3"])

      expect(municipality.top_rated.count).to eq(3)
    end

    it "returns the only rated place out of all places" do
      municipality = Municipality.create name:"Tammisaari"

      ### this is strange, but for whatever reason if I take this loop out, the test gets messed up
      ### at this point the places are empty obviously so it doesn't get into the loop
      municipality.places.each do |place|
        puts "#{place.name}, of class #{place.class.name}"
      end

      add_rated_places(municipality, ["place10"])


      ### this loop is completely unnecessary but demonstrates how the tests gets messed up if the first loop isn't there
      ### if the first loop is commented out, then the first round prints: "place1, of class Place"
      ### and the second round prints: "place1, of class Restaurant"
      ### so for whatever reason they go into the municipality's places as the superclass and subclass
      ### and for whatever reason the count is still only 1, but the loop goes two rounds

      #puts "at the end the count is: #{municipality.places.count}"
      #municipality.places.each do |place|
      #  puts "#{place.name}, of class #{place.class.name}"
      #end

      municipality.places << (Restaurant.create name:"no_ratings")
      municipality.places << (Restaurant.create name:"no_ratings2")


      expect(municipality.top_rated.count).to eq(1)
    end
  end
end

def add_rated_places(municipality, names)
  names.each do |name|
    restaurant = Restaurant.create name:name
    rating = Rating.create points:5
    restaurant.ratings << rating

    municipality.places << restaurant
  end
end
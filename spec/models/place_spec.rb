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
end

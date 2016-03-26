require 'rails_helper'

RSpec.describe Region, type: :model do

  describe "name is set" do

    it "correctly with locale being en" do
      region = FactoryGirl.create(:region_en)

      expect(region.name).to eq("Southwest Finland")
    end

    it "correctly with locale being fi" do
      region = FactoryGirl.create(:region_fi)

      expect(region.name).to eq("Pohjois-Karjala")
    end

    it "as the English locale's name if no Finnish name is given" do
      region = FactoryGirl.create(:region_en)

      I18n.locale = :fi
      expect(region.name).to eq("Southwest Finland")
    end

    it "as the Finnish locale's name if no English name is given" do
      region = FactoryGirl.create(:region_fi)

      I18n.locale = :en
      expect(region.name).to eq("Pohjois-Karjala")
    end
  end

end

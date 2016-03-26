require 'rails_helper'

RSpec.describe Region, type: :model do

  describe "name is set" do

    it "correctly with locale being en" do
      I18n.locale = :en
      region = Region.new name:"Southwest Finland"

      expect(region.name).to eq("Southwest Finland")
    end

    it "correctly with locale being fi" do
      I18n.locale = :fi
      region = Region.new name:"Varsinais-Suomi"

      expect(region.name).to eq("Varsinais-Suomi")
    end

    it "as the English locale's name if no Finnish name is given" do
      I18n.locale = :en
      region = Region.new name:"Southwest Finland"

      I18n.locale = :fi
      puts region.name

      expect(region.name).to eq("Southwest Finland")
    end

    it "as the Finnish locale's name if no English name is given" do
      I18n.locale = :fi
      region = Region.new name:"Kainuu"

      I18n.locale = :en
      puts region.name

      expect(region.name).to eq("Kainuu")
    end
  end

end

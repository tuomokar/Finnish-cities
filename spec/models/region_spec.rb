require 'rails_helper'

RSpec.describe Region, type: :model do
  it "has the name set correctly with locale being en" do
    I18n.locale = :en
    region = Region.new name:"Southwest Finland"

    region.name.should == "Southwest Finland"
  end

  it "has the name set correctly with locale being fi" do
    I18n.locale = :fi
    region = Region.new name:"Varsinais-Suomi"

    region.name.should == "Varsinais-Suomi"
  end

  it "if en name is given but no fi, the fi name is nil" do
    I18n.locale = :en
    region = Region.new name:"Southwest Finland"

    I18n.locale = :fi
    puts region.name

    region.name.should == nil
  end
end

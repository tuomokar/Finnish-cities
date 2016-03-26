require 'rails_helper'

describe "Regions page" do
  describe "in English" do

    it "shows the 'Regions' text" do
      visit regions_path
      expect(page).to have_content "Regions"
    end

    describe "having existing regions" do
      let(:regions){["Southwest Finland", "North Karelia", "Northern Savonia"]}

      it "lists each regions' name" do
        regions.each do |region_name|
          FactoryGirl.create(:region_en, name:region_name)
        end

        visit regions_path

        regions.each do |region_name|
          expect(page).to have_content region_name
        end
      end

      it "allows the user to navigate to page of a region" do
        regions.each do |region_name|
          FactoryGirl.create(:region_en, name: region_name)
        end

        visit regions_path

        click_link "North Karelia"

        expect(page).to have_content("North Karelia")
        expect(page).to have_content("Area: 1000.0")
      end
    end
  end

  describe "in Finnish" do
    it "shows the 'Maakunnat' text" do

      visit regions_path(:fi)
      expect(page).to have_content "Maakunnat"
    end

    describe "having existing regions" do

      let(:regions){["Varsinais-Suomi", "Pohjois-Karjala", "Pohjois-Savo"]}

      it "lists each regions' name" do
        regions.each do |region_name|
          FactoryGirl.create(:region_en, name:region_name)
        end

        visit regions_path(:fi)

        regions.each do |region_name|
          expect(page).to have_content region_name
        end
      end

      it "allows the user to navigate to page of a region" do
        regions.each do |region_name|
          FactoryGirl.create(:region_en, name: region_name)
        end

        visit regions_path(:fi)

        click_link "Pohjois-Karjala"

        expect(page).to have_content("Pohjois-Karjala")
        expect(page).to have_content("Pinta-ala: 1000.0")
      end
    end
  end

end
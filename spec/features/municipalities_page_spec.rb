require 'rails_helper'

describe "Municipalities page" do
  describe "in English" do

    let(:municipalities){["Helsinki", "Hämeenlinna", "Kuhmo"]}

    it "shows the 'Municipalities' text" do
      visit municipalities_path
      expect(page).to have_content("Municipalities")
    end

    describe "having existing regions" do

      it "lists each municipalities' name" do
        municipalities.each do |municipality_name|
          FactoryGirl.create(:municipality_en, name:municipality_name)
        end

        visit municipalities_path

        municipalities.each do |municipality_name|
          expect(page).to have_content municipality_name
        end
      end

      it "allows to navigate to the page of a municipality" do
        municipalities.each do |municipality_name|
          FactoryGirl.create(:municipality_en, name:municipality_name)
        end

        visit municipalities_path

        click_link "Kuhmo"
        expect(page).to have_content "Kuhmo"
        expect(page).to have_content("Population: 100000")
      end
    end

  end

  describe "in Finnish" do

    let(:municipalities){["Helsinki", "Hämeenlinna", "Kuhmo"]}

    it "shows the 'Kunnat' text" do
      visit municipalities_path(:fi)
      expect(page).to have_content("Kunnat")
    end

    describe "having existing municipalities" do

      it "lists each municipalities' name" do
        municipalities.each do |municipality_name|
          FactoryGirl.create(:municipality_en, name:municipality_name)
        end

        visit municipalities_path(:fi)

        municipalities.each do |municipality_name|
          expect(page).to have_content municipality_name
        end
      end

      it "allows to navigate to the page of a municipality" do
        municipalities.each do |municipality_name|
          FactoryGirl.create(:municipality_en, name:municipality_name)
        end

        visit municipalities_path(:fi)

        click_link "Kuhmo"
        expect(page).to have_content "Kuhmo"
        expect(page).to have_content("Väkimäärä: 100000")
      end
    end

  end
end
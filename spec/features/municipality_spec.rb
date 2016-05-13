require 'rails_helper'

include Helpers

describe Municipality do

  let(:municipality){FactoryGirl.create(:municipality_en) }

  describe "there is no access when" do

    describe "when user is not logged in" do

      it "to creation page" do
        visit new_municipality_path

        expect(page).to have_content("You don't have permission to that")
      end

      it "to edit page" do
        visit edit_municipality_path(:en, municipality.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end

    describe "when non-admin is logged in" do
      let!(:user) { FactoryGirl.create :user }

      before :each do
        sign_in(username:"user1", password:"passwordA1")
      end

      it "creation page" do
        expect(page).to have_content("Welcome back!")
        visit new_municipality_path

        expect(page).to have_content("You don't have permission to that")
      end

      it "edit page" do
        expect(page).to have_content("Welcome back!")
        visit edit_municipality_path(:en, municipality.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end
  end

  describe "there is access to a single municipalities' page" do

    let!(:user) { FactoryGirl.create :user }

    it "when user is not logged in" do
      visit municipality_path(:en, municipality.id)

      expect(page).to have_content("Helsinki")
      expect(page).not_to have_content("You don't have permission to that")
    end

    it "when normal user is logged in" do
      sign_in(username:"user1", password:"passwordA1")
      expect(page).to have_content("Welcome back!")

      visit municipality_path(:en, municipality.id)

      expect(page).to have_content("Helsinki")
      expect(page).not_to have_content("You don't have permission to that")
    end

  end


  describe "when admin is logged in" do
    let!(:user) { FactoryGirl.create :user, admin: true }

    before :each do
      sign_in(username:"user1", password:"passwordA1")
    end

    describe "there is access to" do

      it "the creation page" do
        visit new_municipality_path

        expect(page).to have_content("New municipality")
      end

      it "the edit page" do
        visit edit_municipality_path(:en, municipality.id)

        expect(page).to have_content("Editing municipality")
      end
    end

    it "a new municipality is saved when created" do
      count = Municipality.count
      visit new_municipality_path

      fill_in('municipality[name]', with: 'test_mun')
      expect{
        click_button "create"
      }.to change{Municipality.count}.from(count).to(count + 1)
    end

    it "an existing municipality can be edited" do
      visit edit_municipality_path(:en, municipality.id)

      fill_in('municipality[name]', with: 'test_mun')
      click_button "update"

      expect(page).to have_content "Municipality was successfully updated."
      expect(page).to have_content 'test_mun'
    end

    describe "top rated places" do
      it "shows the top rated places" do
        add_rated_places(municipality, ["place1", "place2"])
        visit municipality_path(:en, municipality.id)

        expect(page).to have_content("The top rated places:")
        expect(page).to have_content("place1")
        expect(page).to have_content("place2")

        change_language

        expect(page).to have_content("Parhaimmat paikat:")
      end

      it "tells there are no rated places if there are no rated places" do
        visit municipality_path(:en, municipality.id)

        expect(page).to have_content("The top rated places:")
        expect(page).to have_content("Municipality doesn't have any rated places yet")

        change_language

        expect(page).to have_content("Parhaimmat paikat:")
        expect(page).to have_content("Kunnalla ei ole vielä yhtään arvosteltua paikkaa")
      end
    end
  end
end
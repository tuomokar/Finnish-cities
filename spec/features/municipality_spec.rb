require 'rails_helper'

include Helpers

describe Municipality do

  describe "there is no access when" do
    describe "when user is not logged in" do
      municipality = FactoryGirl.create(:municipality_en)

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

      municipality = FactoryGirl.create(:municipality_en)
      let!(:user) { FactoryGirl.create :user }
      before :each do
        sign_in(username:"user1", password:"passwordA1")
      end

      it "creation page" do
        visit new_municipality_path

        expect(page).to have_content("You don't have permission to that")
      end

      it "edit page" do
        sign_in(username:"User1", password:"passwordA1")
        visit edit_municipality_path(:en, municipality.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end
  end

  describe "when admin is logged in" do
    municipality = FactoryGirl.create(:municipality_en)
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
  end

end
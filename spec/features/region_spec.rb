require 'rails_helper'

describe Region do

  let(:region){FactoryGirl.create(:region_en) }

  describe "there is no access when" do

    describe "when user is not logged in" do
      region = FactoryGirl.create(:region_en)

      it "to creation page" do
        visit new_region_path

        expect(page).to have_content("You don't have permission to that")
      end

      it "to edit page" do
        visit edit_region_path(:en, region.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end

    describe "when non-admin is logged in" do

      let!(:user) { FactoryGirl.create :user, username:"Fooba", password:"Foobar1", password_confirmation:"Foobar1" }
      before :each do
        sign_in(username:"Fooba", password:"Foobar1")
      end

      it "creation page" do
        visit new_region_path

        expect(page).to have_content("You don't have permission to that")
      end

      it "edit page" do
        sign_in(username:"User1", password:"passwordA1")
        visit edit_region_path(:en, region.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end
  end

  describe "there is access to a single region's page" do

    it "when user is not logged in" do
      visit region_path(:en, region.id)

      expect(page).to have_content("Southwest Finland")
      expect(page).not_to have_content("You don't have permission to that")
    end

    it "when normal user is logged in" do
      FactoryGirl.create :user, username:"Foob", password:"Foobar1", password_confirmation:"Foobar1"
      sign_in(username:"Foob", password:"Foobar1")
      expect(page).to have_content("Welcome back!")

      visit region_path(:en, region.id)

      expect(page).to have_content("Southwest Finland")
      expect(page).not_to have_content("You don't have permission to that")
    end

  end


  describe "when admin is logged in" do

    let!(:user) { FactoryGirl.create :user, username:"Foob2", password:"Foobar2", password_confirmation:"Foobar2", admin: true }

    before :each do
      sign_in(username:"Foob2", password:"Foobar2")
    end

    describe "there is access to" do

      it "the creation page" do
        visit new_region_path

        expect(page).to have_content("New Region")
      end

      it "the edit page" do
        visit edit_region_path(:en, region.id)

        expect(page).to have_content("Editing region")
      end
    end

    it "a new region is saved when created" do
      count = Region.count
      visit new_region_path

      fill_in('region[name]', with: 'test_region')
      expect{
        click_button "create"
      }.to change{Region.count}.from(count).to(count + 1)
    end

    it "an existing municipality can be edited" do
      visit edit_region_path(:en, region.id)

      fill_in('region[name]', with: 'test_region')
      click_button "update"

      expect(page).to have_content "Region was successfully updated."
      expect(page).to have_content 'test_region'
    end
  end
end

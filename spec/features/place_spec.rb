require 'rails_helper'

include Helpers

describe "Place page" do

  let!(:user){ FactoryGirl.create(:user, username:"Foob3") }
  let(:restaurant){ FactoryGirl.create(:restaurant) }

  describe "logged in user" do
    it "has the possibility to add ratings" do
      sign_in(username:"Foob3", password:"passwordA1")

      visit restaurant_path(:en, restaurant.id)

      expect(page).to have_content('Rate the restaurant')
      expect(page).to have_content('Points')
      expect(page).to have_content('Comment')

      change_language

      expect(page).to have_content('Arvostele ravintola')
      expect(page).to have_content('Pisteet')
      expect(page).to have_content('Kommentti')

    end

    it "can add ratings" do
      sign_in(username:"Foob3", password:"passwordA1")

      visit restaurant_path(:en, restaurant.id)

      fill_in('rating[points]', :with => '2')
      click_button('Rate')

      expect(page).to have_content('Rating was successfully created.')
    end

    it "gets the error message if too big score is given" do
      sign_in(username:"Foob3", password:"passwordA1")

      visit restaurant_path(:en, restaurant.id)

      fill_in('rating[points]', :with => '6')
      click_button('Rate')

      expect(page).to_not have_content('Rating was successfully created.')
      expect(page).to have_content('Points must be between 1 and 5')
    end

    it "gets the error message if too small score is given" do
      sign_in(username:"Foob3", password:"passwordA1")

      visit restaurant_path(:en, restaurant.id)

      fill_in('rating[points]', :with => '0')
      click_button('Rate')

      expect(page).to_not have_content('Rating was successfully created.')
      expect(page).to have_content('Points must be between 1 and 5')
    end
  end

  describe "not logged in user" do
    it "can't see the form to add new ratings" do
      visit restaurant_path(:en, restaurant.id)

      expect(page).to_not have_content('Rate the restaurant')
      expect(page).to_not have_content('Points')
      expect(page).to_not have_content('Comment')

      change_language

      expect(page).to_not have_content('Arvostele ravintola')
      expect(page).to_not have_content('Pisteet')
      expect(page).to_not have_content('Kommentti')
    end
  end
end

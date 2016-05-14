require 'rails_helper'

include Helpers

describe "Users page" do

  let!(:user){FactoryGirl.create(:user, username:"Foob") }
  let!(:admin){FactoryGirl.create(:user, username:"Admin1", admin: true) }

  describe "for admin" do
    it "users are visible" do
      sign_in(username:"Admin1", password:"passwordA1")
      visit users_path(:en)

      expect(page).to have_content "Current admin users"
      expect(page).to have_content "Users:"
      expect(page).to have_content("Foob")

      change_language
      expect(page).to have_content "Tämänhetkiset admin-käyttäjät"
      expect(page).to have_content "Käyttäjät:"
      expect(page).to have_content("Foob")

    end
  end

  describe "for normal user" do
    it "users are not visible" do
      sign_in(username:"Foob", password:"passwordA1")
      visit users_path(:en)

      expect(page).to have_content "Current admin users"
      expect(page).to have_content "Admin1"
      expect(page).to_not have_content "Users:"

      change_language
      expect(page).to have_content "Tämänhetkiset admin-käyttäjät"
      expect(page).to have_content "Admin1"
      expect(page).to_not have_content "Käyttäjät:"

    end
  end
end
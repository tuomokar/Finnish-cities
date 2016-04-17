require 'rails_helper'

describe User do

  let!(:user){FactoryGirl.create(:user, username:"Foob3") }
  let!(:user2){FactoryGirl.create(:user, username:"Foob4") }
  let!(:user3){FactoryGirl.create(:user, username:"Foob5", admin: true) }

  describe "has no access to" do

    describe "edit page of another user" do
      it "when not logged in" do
        visit edit_user_path(:en, user.id)

        expect(page).to have_content("You don't have permission to that")
      end

      it "when logged in as normal user" do
        sign_in(username:"Foob3", password:"Foobar2")
        visit edit_user_path(:en, user2.id)

        expect(page).to have_content("You don't have permission to that")
      end
    end

  end

  describe "has access to" do

    describe "edit page" do
      it "of self when logged in as normal user" do
        sign_in(username:"Foob4", password:"passwordA1")
        visit edit_user_path(:en, user2.id)

        expect(page).to have_field("user[username]", with:"Foob4")
        expect(page).not_to have_content("You don't have permission to that")
      end

      it "of anyone when logged in as admin" do
        sign_in(username:"Foob5", password:"passwordA1")

        visit edit_user_path(:en, user.id)

        expect(page).to have_content("Changing User Information")
        expect(page).to have_field("user[username]", with:"Foob3")
        expect(page).not_to have_content("You don't have permission to that")

        visit edit_user_path(:en, user2.id)

        expect(page).to have_content("Changing User Information")
        expect(page).to have_field("user[username]", with:"Foob4")
        expect(page).not_to have_content("You don't have permission to that")

        visit edit_user_path(:en, user3.id)

        expect(page).to have_content("Changing User Information")
        expect(page).to have_field("user[username]", with:"Foob5")
        expect(page).not_to have_content("You don't have permission to that")
      end
    end
  end

  describe "info can be edited by" do
    it "user themselves" do
      sign_in(username:"Foob4", password:"passwordA1")
      visit edit_user_path(:en, user2.id)

      fill_in('user[username]', with: 'test_username1')
      fill_in('user[password]', with: 'Foobar1')
      fill_in('user[password_confirmation]', with: 'Foobar1')
      click_button "update"

      expect(page).to have_content "User was successfully updated."
      expect(page).to have_content 'test_username1'
    end

    it "an admin" do
      sign_in(username:"Foob5", password:"passwordA1")
      visit edit_user_path(:en, user2.id)

      fill_in('user[username]', with: 'test_username2')
      fill_in('user[password]', with: 'Foobar1')
      fill_in('user[password_confirmation]', with: 'Foobar1')
      click_button "update"

      expect(page).to have_content "User was successfully updated."
      expect(page).to have_content 'test_username2'
    end
  end

  it "is logged in immediately after having registered" do
    visit new_user_path
    fill_in('user[username]', with: 'Foob6')
    fill_in('user[password]', with: 'Foobar6')
    fill_in('user[password_confirmation]', with: 'Foobar6')
    click_button "create"

    expect(page).to have_content "User was successfully created, welcome!."
    expect(page).to have_content 'username: Foob6'
  end
end


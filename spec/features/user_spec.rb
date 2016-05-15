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

        expect(page).to have_content('Changing User Information')
        expect(page).not_to have_content("You don't have permission to that")
      end

      it "of anyone when logged in as admin" do
        sign_in(username:"Foob5", password:"passwordA1")

        visit edit_user_path(:en, user.id)

        expect(page).to have_content("Changing User Information")
        expect(page).not_to have_content("You don't have permission to that")

        visit edit_user_path(:en, user2.id)

        expect(page).to have_content("Changing User Information")
        expect(page).not_to have_content("You don't have permission to that")

        visit edit_user_path(:en, user3.id)

        expect(page).to have_content("Changing User Information")
        expect(page).not_to have_content("You don't have permission to that")
      end
    end
  end

  describe "editing" do
    it "is successful when given the correct current password" do
      sign_in(username:"Foob4", password:"passwordA1")
      visit edit_user_path(:en, user2.id)

      fill_in('user[current_password]', with: 'passwordA1')
      fill_in('user[password]', with: 'Foobar1')
      fill_in('user[password_confirmation]', with: 'Foobar1')
      click_button "update"

      expect(page).to have_content "User was successfully updated"
      expect(page).to have_content 'Foob4'

      change_language

      fill_in('user[current_password]', with: 'Foobar1')
      fill_in('user[password]', with: 'Foobar12')
      fill_in('user[password_confirmation]', with: 'Foobar12')
      click_button "päivitä"

      expect(page).to have_content "Tietoja päivitettiin onnistuneesti"
      expect(page).to have_content 'Foob4'

    end

    it "can't be done if given the wrong current password" do
      sign_in(username:"Foob4", password:"passwordA1")
      visit edit_user_path(:en, user2.id)

      fill_in('user[current_password]', with: 'wrongPass1')
      fill_in('user[password]', with: 'Foobar1')
      fill_in('user[password_confirmation]', with: 'Foobar1')
      click_button "update"

      expect(page).to have_content "Password doesn't match the old password"
      expect(page).to have_content 'Foob4'

      change_language
      fill_in('user[current_password]', with: 'wrongPass1')
      fill_in('user[password]', with: 'Foobar1')
      fill_in('user[password_confirmation]', with: 'Foobar1')
      click_button "päivitä"

      expect(page).to have_content "Antamasi salasana ei vastannut oikeaa salasanaasi"
      expect(page).to have_content 'Foob4'
    end



  end

  it "is logged in immediately after having registered" do
    visit new_user_path

    fill_in('user[username]', with: 'Foob6')
    fill_in('user[password]', with: 'Foobar6')
    fill_in('user[password_confirmation]', with: 'Foobar6')
    click_button "create"

    expect(page).to have_content "User was successfully created, welcome!"
    expect(page).to have_content 'Foob6'
  end
end


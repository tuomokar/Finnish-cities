require 'rails_helper'

describe "Session page" do

  it "non-logged in user can get to signin page" do
    visit signin_path

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end

  it "non-logged in user can not signin with non-existing user info" do
    visit signin_path

    fill_in('username', with: "random_username")
    fill_in('password', with: "random_password")

    click_button('log in')

    expect(page).to have_content("Username and/or password mismatch")
    expect(page).to have_content("Sign in")
  end

  it "non-logged in user can signin with existing user info" do
    FactoryGirl.create(:user)
    visit signin_path

    fill_in('username', with: "user1")
    fill_in('password', with: "passwordA1")

    click_button('log in')

    expect(page).to have_content("Welcome back!")
    expect(page).to have_content("username: user1 ")
  end

end
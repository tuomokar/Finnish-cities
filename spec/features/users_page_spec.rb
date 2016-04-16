require 'rails_helper'

describe "Users page" do
  describe "in English" do

    it "shows the 'Users' text" do
      visit users_path
      expect(page).to have_content "Users"
    end

    describe "having existing users" do
      let(:usernames){["user1", "user2", "user3"]}

      it "lists each users' name" do
        usernames.each do |username|
          FactoryGirl.create(:user, username:username)
        end

        visit users_path

        usernames.each do |username|
          expect(page).to have_content username
        end
      end
    end
  end

  describe "in Finnish" do

    it "shows the 'Käyttäjät' text" do
      visit users_path(:fi)
      expect(page).to have_content "Käyttäjät"
    end
  end
end
require 'rails_helper'

describe Region do

  describe "page can't be accessed when" do
    it "user is not logged in" do
      visit new_region_path

      expect(page).to have_content("You don't have permission to that")
    end
  end


  #describe "that is being created" do
   # it "is saved not saved when user is not logged in" do

   #   visit new_region_path


    #  fill_in('region[name]', with: 'test_mun')
   #   fill_in('region[area]', with: 300)
   #   fill_in('region[population]', with: 100)
   #   fill_in('region[description]', with: 'This municipality is for a test')
   #   fill_in('region[link]', with: "www.testmun.com")

   #   expect{
    #    click_button "create"
    #  }.to change{Region.count}.from(0).to(1)
    #end
  #end
end

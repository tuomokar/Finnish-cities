require 'rails_helper'

describe Municipality do

  describe "that is being created" do
    it "is saved" do

      visit new_municipality_path


      fill_in('municipality[name]', with: 'test_mun')
      fill_in('municipality[year]', with: 300)
      fill_in('municipality[description]', with: 'This municipality is for a test')
      fill_in('municipality[population]', with: 100)
      fill_in('municipality[link]', with: "www.testmun.com")
      fill_in('municipality[region_id]', with: 1)

      expect{
        click_button "create"
      }.to change{Municipality.count}.from(0).to(1)
    end
  end
end
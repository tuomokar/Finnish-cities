module Helpers

  def sign_in(credentials)
    visit signin_path
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('log in')
  end

  def change_language
    if I18n.locale == :en
      click_link('fi')
      puts
    else
      click_link('en')
    end
  end

  def add_rated_places(municipality, names)
    points = 1
    names.each do |name|
      restaurant = Restaurant.create name:name
      rating = Rating.create points:points
      restaurant.ratings << rating

      municipality.places << restaurant

      points += 1
      points = 1 if points == 6
    end
  end
end
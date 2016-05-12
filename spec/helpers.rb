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
end
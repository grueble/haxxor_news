module HaxxorNews
  module IntegrationHelper
    def sign_in_as(user)
      visit '/session/new'
      
      fill_in 'username', :with => user.username
      fill_in 'password', :with => user.password
      
      click_button 'Sign In'
    end
  end
end

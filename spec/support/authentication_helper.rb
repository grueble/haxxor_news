module HaxxorNews
  module AuthenticationHelper
    def login_as(user)
      session[:current_user_id] = user.id
    end
  end
end

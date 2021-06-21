module SessionsHelper

  # log in user you were given
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns current user logged in
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # return true if user is logged in, false otherwise 
  def logged_in?
    !current_user.nil?
  end

  # log out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end

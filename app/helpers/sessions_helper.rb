module SessionsHelper

  # log in user you were given
  def log_in(user)
    session[:user_id] = user.id
  end

  # Make the user's session permanent
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns current user logged in
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # return true if the passed user is the current user
  def current_user?(user)
    user&. == current_user
  end

  # return true if user is logged in, false otherwise 
  def logged_in?
    !current_user.nil?
  end

  # destroy permanent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # log out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # redirect to the memorized URL (or default value)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # remember URL you were trying to access
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end

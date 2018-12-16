class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_sessions_url
    end
  end

  def ensure_user_owns_reservation
    unless current_user == @preservation.user
      flash[:alert] = "Not your reservation"
      redirect_to new_sessions_url
    end
  end

  def ensure_user_owns_restaurant
    unless current_user == @restaurant.user
      flash[:alert] = "Only for restaurant owner"
      redirect_to new_sessions_url
    end
  end

end

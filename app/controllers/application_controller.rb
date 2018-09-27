class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_official

  def current_user
  	@user = User.find_by_id(session["user_id"])
  end

  def current_official
  	@official = Official.find_by_id(session["official_id"])
  end

  def current_catcher
    @catcher = Catcher.find_by_id(session["catcher_id"])
  end
  
end

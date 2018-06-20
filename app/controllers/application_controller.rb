class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def set_oauth_false
    @using_oauth = false
  end
end

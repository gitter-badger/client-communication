class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  REALM = "phi"
  USERS = { ENV['ADMIN_LOGIN'] => ENV['ADMIN_PASS'] }  #ha1 digest password


  before_action :authenticate, except: [:progress, :root, :feedback]
 
  private
 
    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end

end

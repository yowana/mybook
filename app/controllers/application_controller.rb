class ApplicationController < ActionController::Base
  layout "store"
  before_filter :authorize, :except => :login
  before_filter :set_locale
  helper :all # include all helpers, all the time
  
  protect_from_forgery :secret =>
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      if session[:user_id] != :logged_out
        authenticate_or_request_with_http_basic('mybook') do |username, password|
          user = User.authenticate(username, password)
          session[:user_id] = user.id if user
        end
      else 
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
  end
  
  def set_locale
    session[:locale] =params[:locale] if params[:locale]
    I18n.locale = sessiom[:locale] || I18n.default_locale
  end
end 

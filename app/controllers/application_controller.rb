class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :locale_setter

  def locale_setter
    binding
    I18n.locale = params[:locale] #|| I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  private
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

end

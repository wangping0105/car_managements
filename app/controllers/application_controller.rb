class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  include ApplicationHelper

  def current_store
    if current_user.present?
      @current_user ||= current_user.store
    else
      render 'no_auth.html'
      return
    end
  end

  def redirect_back_or(default)
    redirect_to (cookies[:return_to] || default)
    cookies.delete(:return_to)
  end

  def store_location
    cookies[:return_to] = request.fullpath if request.get?
  end

  def signed_in?
    !current_user.nil?
  end

  def check_authority
    if !current_user.nil? && !current_user.status
      return true
    end
    false
  end

  private

  # set the language
  def set_locale
    if params[:locale].blank?
      I18n.locale = extract_locale_from_accept_language_header
    else
      I18n.locale = params[:locale]
    end
  end

  # pass in language as a default url parameter
  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  # extract the language from the clients browser
  def extract_locale_from_accept_language_header
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
    if I18n.available_locales.include? browser_locale
      browser_locale
    else
      I18n.default_locale
    end
  end
end

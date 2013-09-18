class DashboardController < ApplicationController

  def index
    current_user = nil
  end

  def locales
  end

  def set_locale
    I18n.locale = params[:locale]
    redirect_to dashboard_index_path
  end


end

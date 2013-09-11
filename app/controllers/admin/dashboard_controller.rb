class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => "admin", :password => "terminal"

  layout "admin"

  def index
  end

end
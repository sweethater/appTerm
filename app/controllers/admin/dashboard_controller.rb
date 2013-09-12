class Admin::DashboardController < ApplicationController

  setting = Setting.find(1)
  name = setting.admin_name
  password = setting.admin_password

  http_basic_authenticate_with :name => name, :password => password

  layout "admin"

  def index
  end

end
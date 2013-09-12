class Admin::SettingController < Admin::DashboardController

  def show
    @setting = Setting.find(1)
    @attributes = @setting.attributes.values[1..-3]
    #binding.pry
  end

  def edit
    @setting = Setting.find(1)
  end

  def update
    @setting = Setting.find(1)
    @setting.update_attributes(params[:setting])
    redirect_to admin_root_path
  end

end
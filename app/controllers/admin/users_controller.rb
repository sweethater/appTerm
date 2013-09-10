class Admin::UsersController < Admin::DashboardController

  def index
    @users = User.all
  end

  def destroy
    @user = Users.find(params[:id])
    @users.destroy
    redirect_to admin_users_path
  end

end
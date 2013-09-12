class Admin::UsersController < Admin::DashboardController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @program = @user.program
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to admin_users_path
  end

  def create
    @user = User.new(params[:user])
    #if
    @user.save
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

end
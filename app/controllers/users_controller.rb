class UsersController < ApplicationController

  #after_filter :find, :only => [:search]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'ok'
    else
      flash[:error] = 'dp'
    end
    redirect_to programs_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def search

  end

  def find
    @user = User.find_by_name(params[:name])
    if @user
      redirect_to programs_path
    else
      redirect_to search_users_path
    end
  end

  def info

  end

  def show_info
    @user = User.find_by_name(params[:name])
    @user_programs = []
    if @user
      # programs = Program.all
      # programs.each do |program|
      #   program.users.each do |u|
      #     if u == @user.name
      #       @user_programs << program
      #     end
      #   end
      # end
    else
      redirect_to info_users_path
    end
  end

end
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
    redirect_to user_programs_path(@user.id)
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
      @_current_user = @user
      session[:current_user_id] = @user.id
      redirect_to user_programs_path(@user.id)
    else
      redirect_to search_users_path
    end
  end

  def info

  end

  def show_info
    @user = User.find_by_name(params[:name])
    @user_program = Program.find(@user.program_id)
    # @user_program = []
    # @user_program << Program.find(@user.program_id)
    if @user
      # @user_programs = []
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
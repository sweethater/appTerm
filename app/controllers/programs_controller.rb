class ProgramsController < ApplicationController

  def index
    @programs = Program.all
    @user = User.find(params[:user_id])

    unless @user.program_id.nil?
      @programs.clear
      @programs << Program.find(@user.program_id)
    end

  end

  def info
    @program = Program.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def user_info
    @program = Program.find(params[:id])
    @user = User.find(params[:user_id])

    @program_tasks = @program.tasks
  end

  def task
    @program = Program.find(params[:id])
    @tasks_count = @program.tasks.count
    @user = User.find(params[:user_id])

    #User.scope_search(@user.name)
  end

  def begin_program
    @program = Program.find(params[:id])
    @user = User.find(params[:user_id])

    @user.program_id = @program.id
    @user.program_status = 1

    @program.tasks.count.times do
      @user.task_readed << false
      @user.task_percentage << nil
    end

    @user.save

    redirect_to info_user_program_path( @user.id, @program.id)
  end

  def destroy
    @user = User.find(:user_id)
    @user.program_id = nil
    @user.program_status = 0
    @user.task_readed = []
    @user.task_percentage = []

    @user.save

  end


end
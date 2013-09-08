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
    @user.save
    redirect_to info_program_path(@program)
  end



end
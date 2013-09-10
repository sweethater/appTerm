class ProgramsController < ApplicationController

  def index
    @programs = Program.all.reject {|p| p.tasks.count == 0 }
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
    @user = User.find(params[:user_id])

    @tasks_count = @program.tasks.count
    @task_number = @user.task_percentage.index(nil)

    @task = @program.tasks[@task_number]

    @user.task_readed[@task_number] = true
    @user.last_task_number = @task_number
    @user.save

  end

  def begin_program
    @program = Program.find(params[:id])
    @user = User.find(params[:user_id])

    @user.program_id = @program.id
    @user.program_status = 1
    @user.save

    @program.tasks.count.times do
      @user.task_readed << false
      @user.task_percentage << nil
      @user.save
    end

    redirect_to info_user_program_path( @user.id, @program.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.program_id = nil
    @user.program_status = false
    @user.task_readed = []
    @user.task_percentage = []
    @user.last_task_number = nil

    @user.save

    redirect_to user_programs_path(@user.id)
  end


end
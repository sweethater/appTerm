class TasksController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @program = Program.find(@user.program_id)
    @task = @program.tasks[@user.last_task_number]

    @tasks_count = @program.tasks.count
    @current_task_number = @user.last_task_number + 1
  end

  def answer
    @user = User.find(params[:user_id])
    @program = Program.find(@user.program_id)
    @task = @program.tasks[@user.last_task_number]

    @tasks_count = @program.tasks.count
    @current_task_number = @user.last_task_number + 1

    @user.task_percentage[@user.last_task_number] = true
    @user.save

  end

end
class TasksController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @program = Program.find(@user.program_id)
    @task = @program.tasks[@user.last_task_number]

    @tasks_count = @program.tasks.count
    @current_task_number = @user.last_task_number + 1

    @task.task_answers.shuffle!
  end

  def answer
    @user = User.find(params[:user_id])
    @program = Program.find(@user.program_id)
    @task = @program.tasks[@user.last_task_number]

    @tasks_count = @program.tasks.count
    @current_task_number = @user.last_task_number + 1

    case @task.question_type
    when 0
      if params[:value].downcase == @task.question_answer.downcase
        @user.task_percentage[@user.last_task_number] = true
      else
        @user.task_percentage[@user.last_task_number] = false
      end

    when 1
      if params[:value].downcase == @task.question_answer.downcase
        @user.task_percentage[@user.last_task_number] = true
      else
        @user.task_percentage[@user.last_task_number] = false
      end

    when 2
      if params[:user_answer].to_i == @task.question_answer.to_i
        @user.task_percentage[@user.last_task_number] = true
      else
        @user.task_percentage[@user.last_task_number] = false
      end
    end

    @user.save

    #binding.pry

  end

end
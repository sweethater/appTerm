class TasksController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @program = Program.find(@user.program_id)
    @task = Task.find(params[:id])
    #@task = @program.tasks[@user.last_task_number]

    @tasks_count = @program.tasks.count
    @current_task_number = @user.last_task_number + 1
    #binding.pry
    @task.task_answers.shuffle!
  end

  def task_recap
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @program = Program.find(@user.program_id)

    @user.task_percentage[@program.tasks.index(@task)] = nil
    @user.last_task_number = @program.tasks.index(@task)
    @user.save
    #binding.pry
    redirect_to user_task_path(@user.id, @task.id)

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

  def task_again
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @program = Program.find(@user.program_id)
    #binding.pry

    @user.task_readed[@program.tasks.index(@task)] = false
    @user.task_percentage[@program.tasks.index(@task)] = nil
    @user.save

    redirect_to task_user_program_path(@user.id, @program.id)

  end




end
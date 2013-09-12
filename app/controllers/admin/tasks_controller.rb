class Admin::TasksController < Admin::DashboardController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @program = Program.find(params[:program_id])
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
    @program = @task.program
  end

  def update
    @task = Task.find(params[:id])
    binding.pry

    @task.name = params[:name]
    @task.task = params[:task]
    @task.rec = params[:rec]
    @task.reverse = params[:reverse]
    @task.question = params[:question]

    @task.good = params[:good]
    @task.bad = params[:bad]

    @task.question_answer = params[:answer1]

    @task.task_answers.clear

    @task.task_answers << params[:answer1]
    @task.task_answers << params[:answer2]
    @task.task_answers << params[:answer3]
    @task.task_answers << params[:answer4]
    @task.task_answers << params[:answer5]

    @task.task_answers.delete_if {|a| a == ""}

    case @task.task_answers.count
    when 1
      @task.question_type = 2 # answer
    when 2
      @task.question_type = 0 # yes/no
    else
      @task.question_type = 1 # block
    end

    @task.save

    redirect_to admin_tasks_path
  end

  def create
    #binding.pry
    @task = Task.new

    @task.name = params[:name]
    @task.task = params[:task]
    @task.rec = params[:rec]
    @task.reverse = params[:reverse]
    @task.question = params[:question]

    @task.good = params[:good]
    @task.bad = params[:bad]

    @task.program_id = params[:program_id]
    @task.question_answer = params[:answer1]

    @task.task_answers << params[:answer1]
    @task.task_answers << params[:answer2]
    @task.task_answers << params[:answer3]
    @task.task_answers << params[:answer4]
    @task.task_answers << params[:answer5]

    @task.task_answers.delete_if {|a| a == ""}

    case @task.task_answers.count
    when 1
      @task.question_type = 2 # answer
    when 2
      @task.question_type = 0 # yes/no
    else
      @task.question_type = 1 # block
    end

    @task.save

    redirect_to admin_programs_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path
  end

end

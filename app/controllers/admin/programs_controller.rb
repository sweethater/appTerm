class Admin::ProgramsController < Admin::DashboardController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(params[:program])
    #if
    @program.save
    redirect_to admin_programs_path
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to admin_programs_path
  end

end
class Admin::ProgramsController < Admin::DashboardController

  def index
    @programs = Program.all
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to admin_programs_path
  end

end
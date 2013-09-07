class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def info
    @program = Program.find(params[:id])
  end



end
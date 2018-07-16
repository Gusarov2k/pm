class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:owner)
  end

  def show
  	@project = Project.find(params[:id])

  end

end

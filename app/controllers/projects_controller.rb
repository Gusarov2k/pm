class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.includes(:owner)
  end

  def show
  	# @project = Project.find(params[:id])
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = current_user.project.new(project_params)
  	
  	if @project.save
  		redirect_to project_path
  	else
  		render :new
  	end
  end

  def edit
  	# @project = Project.find(params[:id])
  end

  def update
  	# @project = Project.find(params[:id])
  	if @project.update(project_params)
  		redirect_to project_path
  	else
  		render :edit
  	end
  end

  def destroy
  	# @project = Project.find(params[:id])
  	@project.destroy
  	redirect_to project_path
  end

private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name)
	end
end

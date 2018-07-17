class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:owner)
  end

  def show
  	@project = Project.find(params[:id])
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = current_user.project.new(params.require(:project).permit(:name))
  	
  	if @project.save
  		redirect_to project_path
  	else
  		render :new
  	end
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])
  	if @project.update(params.require(:project).permit(:name))
  		redirect_to project_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@project = Project.find(params[:id])
  	@project.destroy
  	redirect_to project_path
  end

end

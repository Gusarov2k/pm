class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:owner)
  end
end

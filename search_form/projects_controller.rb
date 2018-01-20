class ProjectsController < ApplicationController
  def index
    @projects = Project.search(params[:search])
  end
end


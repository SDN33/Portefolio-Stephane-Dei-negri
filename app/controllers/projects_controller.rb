class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    unless Project.exists?(params[:id])
      redirect_to projects_path, alert: "Projet non trouvé."
      return
    end

    @project = Project.find(params[:id])
  end


  private

  def set_project
    @project = Project.find_by(id: params[:id])
    redirect_to(projects_path, alert: "Projet non trouvé.") unless @project
  end

end

class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project Created"
    else
      flash.now[:alert] = "Project not Created"
      render :new
    end
  end

  def show
    @project = find_project
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = find_project
  end

  def update
    @project = find_project
    if @project.update(project_params)
      redirect_to @project, notice: "Project Updated."
    else
      flash.now[:alert] = "Project not Updated."
      render :edit
    end
  end

  def destroy
    @project = find_project
    @project.destroy

    redirect_to projects_path, notice: "Project Deleted."
  end

  private

  def find_project
    Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, alert: "The project you were looking for doesn't exist"
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end

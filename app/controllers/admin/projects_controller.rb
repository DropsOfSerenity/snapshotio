class Admin::ProjectsController < Admin::ApplicationController
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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, notice: "Project Deleted."
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end

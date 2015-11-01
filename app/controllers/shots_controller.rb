class ShotsController < ApplicationController
  def new
    @project = find_project
    @shot = @project.shots.build
  end

  def create
    @project = find_project
    @shot = @project.shots.build(shot_params)

    if @shot.save
      redirect_to [@project, @shot], notice: "Shot Created."
    else
      flash.now[:alert] = "Shot not created."
      render :new
    end
  end

  def show
    @project = find_project
    @shot = @project.shots.find(params[:id])
  end

  def index
    @project = find_project
    @shots = @project.shots
  end

  def destroy
    @project = find_project
    @shot = @project.shots.find(params[:id])
    @shot.destroy
    redirect_to @project, notice: "Shot deleted."
  end

  private

  def find_project
    Project.find(params[:project_id])
  end

  def shot_params
    params.require(:shot).permit(:name, :image)
  end
end

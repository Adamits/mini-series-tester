class Projects::CompositionsController < ApplicationController
  before_action :project

  def index
    @compositions = @project.compositions
  end

  def show
    @composition = @project.compositions.where(id: params[:id]).last
  end

  def would_keep_reading
    @composition = @project.compositions.where(id: params[:id]).last
    if current_user.cast_vote("Vote::WouldKeepReading", @composition)
      redirect_to project_composition_path(@project, @composition)
    else
      render :show
    end
  end

  private

  def project
    @project = Project.find(params[:project_id])
  end
end

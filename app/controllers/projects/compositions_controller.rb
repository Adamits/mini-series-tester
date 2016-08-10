class Projects::CompositionsController < ApplicationController
  before_action :project

  def index
    @compositions = @project.published_compositions
  end

  def show
    authorize_composition || return
    redirect_to compositions_path unless @composition.published?
  end

  def would_keep_reading
    authorize_composition || return
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

  def authorize_composition
    @composition = @project.compositions.where(id: params[:id]).last
    if @composition.published?
      true
    else
      redirect_to compositions_path
    end
  end
end

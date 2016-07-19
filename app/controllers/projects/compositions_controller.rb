class Projects::CompositionsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @compositions = @project.compositions
  end

  def show
    @project = Project.find(params[:project_id])
    @composition = @project.compositions.where(id: params[:id]).last
  end
end

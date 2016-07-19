class Account::Projects::CompositionsController < ApplicationController
  before_action :authorize_project

  def index

  end

  def show
    @composition = @project.compositions.where(id: params[:id]).last
  end

  def edit
    @composition = @project.compositions.where(id: params[:id]).last
  end

  def update
    @composition = @project.compositions.where(id: params[:id]).last
    if @composition.update_attributes(composition_params)
      redirect_to account_project_path(@project)
    else
      render :new
    end
  end

  def new
    @composition = @project.compositions.new
  end

  def create
    @composition = @project.compositions.build(composition_params)
    @composition.user = current_user
    if @composition.save
      redirect_to account_project_path(@project)
    else
      render :new
    end
  end

  private
  def authorize_project
    @project = current_user.projects.where(id: params[:project_id]).last

    if !@project
      redirect_to account_settings_path
    end
  end

  def composition_params
    params.require(:composition).permit(:title, :description, :content, :published)
  end
end

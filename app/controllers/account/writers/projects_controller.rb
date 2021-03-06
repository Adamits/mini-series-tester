class Account::Writers::ProjectsController < AccountController
  before_action :account_navigation

  def index

  end

  def show
    @project = current_user.projects.where(id: params[:id]).last
  end

  def edit
    @project = current_user.projects.where(id: params[:id]).last
  end

  def update
    @project = current_user.projects.where(id: params[:id]).last
    if @project.update_attributes(project_params)
      redirect_to account_writer_path
    else
      render :edit
    end
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to account_writer_path
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :collaborative)
  end

  def account_navigation
    @account_navigation = "writer"
  end
end

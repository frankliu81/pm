class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      #render text: "SUCCESS"
      redirect_to project_path(@project)
    else
      #render text: "FAILURE"
      render :new
    end
  end

  def show
    @task = Task.new
    puts "===================== inside project controller show"

  end

  def index
    @projects = Project.all
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    project_params = params.require(:project).permit([:title, :description, :due_date])
  end

end

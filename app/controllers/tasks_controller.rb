class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:title, :project_id, :due_date)
    @task = Task.new(task_params)

    if @task.save
      #render text: "SUCCESS"
      redirect_to task_path(@task)
    else
      #render text: "FAILURE"
      render :new
    end
  end

  def show
    @task = Task.find params[:id]
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    task_params = params.require(:task).permit([:title, :project_id, :due_date])

    if @task.update task_params
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end

end

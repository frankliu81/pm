class TasksController < ApplicationController
  def new
    @task = Task.new
  end


  def create
    @project = Project.find params[:project_id]

    task_params = params.require(:task).permit(:title, :body, :due_date)
    @task = Task.new(task_params)

    # important association
    @task.project = @project


    if @task.save
      #render text: "SUCCESS"
      redirect_to project_path(@project), notice: "Task created"
    else
      #render text: "FAILURE"
      flash[:alert] = "Task is not saved"
      render "projects/show"
    end
  end

  def show
    @task = Task.find params[:id]
  end

  def index
    @tasks = Task.all
  end


  def edit
    @project = Project.find params[:project_id]
    #puts "===== project_id: #{@project.id} ===="

    @task = Task.find params[:id]
    #puts "===== task_id: #{@task.id} ===="
  end

  def update
    @task = Task.find params[:id]
    task_params = params.require(:task).permit([:title, :body, :due_date])

    if @task.update task_params
      redirect_to project_path(@task.project)
    else
      render :edit
    end
  end

  def destroy
    project = Project.find params[:project_id]

    @task = Task.find params[:id]
    @task.destroy
    redirect_to project_path(@task.project), notice: "Task deleted"
  end

  def status_change

    @task = Task.find params[:id]

    if @task.status == 'Not Done'
       @task.status = 'Done'
    elsif @task.status == 'Done'
      @task.status = 'Not Done'
    else
      @task.status = 'Not Done'
    end

    @task.save

    redirect_to project_path(@task.project)

  end

end

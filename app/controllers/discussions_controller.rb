class DiscussionsController < ApplicationController

  # trying to be more explicit in each controller actions
  # that we need project associated with the discussion
  # in code, instead of having multiple before_actions
  # before_action :find_project
  # before_action :find_discussion, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find params[:project_id]
    @discussion = Discussion.new
  end

  def create
    @project = Project.find params[:project_id]
    @discussion = Discussion.new(discussion_params)

    # assign discussion to project
    @discussion.project = @project

    if @discussion.save
      #render text: "SUCCESS"
      redirect_to project_discussions_path(@project), notice: "Discussion created"
    else
      #render text: "FAILURE"
      flash[:alert] = "Discussion not created"
      render "projects/show"
    end
  end

  def edit
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.find params[:id]
    if @discussion.update discussion_params
      redirect_to project_discussion_path(@project, @discussion), notice: "Discussion updated"
    else
      render :edit
    end

  end

  def index
    # show only the discussion for the particular projects
    @project = Project.find params[:project_id]
    @discussions = @project.discussions

    # allow for creation of new discussion on the index page of discussions
    @discussion = Discussion.new
  end

  def show
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.find params[:id]
    @comment = Comment.new
    # puts "===================== inside discussion controller show"
  end

  def destroy
    @project = Project.find params[:project_id]
    discussion = @project.discussions.find params[:id]
    discussion.destroy
    redirect_to project_discussions_path(@project), notice: "Discussion deleted!"

  end


private

  def discussion_params
    discussion_params = params.require(:discussion).permit([:title, :body])
  end

  # def find_project
  #   @project = Project.find_by params[:project_id]
  #   # redirect_to projects_path, alert: "No project found for this discussion" if @project == nil
  #   # puts "===================== after redirect_to_projects_path"
  # end

  # def find_discussion
  #   @discussion = Discussion.find params[:id]
  # end


end

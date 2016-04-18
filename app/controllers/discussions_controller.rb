class DiscussionsController < ApplicationController

  before_action :find_project_and_redirect_if_invalid
  before_action :find_discussion, only: [:show, :edit, :update, :destroy]

  def new
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

  def index
    # show only the discussion for the particular projects
    @project = Project.find params[:project_id]
    @discussions = @project.discussions

    # allow for creation of new discussion on the index page of discussions
    @discussion = Discussion.new
  end

  def show
    @comment = Comment.new
  end

  def destroy

    project = Project.find params[:project_id]
    discussion = project.discussions.find params[:id]
    discussion.destroy
    redirect_to project_path(project), notice: "Discussion deleted!"

  end


private

  def find_project_and_redirect_if_invalid
    @project = Project.find params[:project_id]
    if !@project
      redirect_to projects_path
    end
  end

  def find_discussion
    @discussion = Discussion.find params[:id]
  end


  def discussion_params
    discussion_params = params.require(:discussion).permit([:title, :body])
  end

end

class DiscussionsController < ApplicationController

  before_action :find_discussion, only: [:show, :edit, :update, :destroy]

  def index
    # show only the discussion for the particular projects
    @project = Project.find params[:project_id]
    @discussions = @project.discussions
  end

  def show
    @comment = Comment.new
  end

  private
  def find_discussion
    @discussion = Discussion.find params[:id]
  end

end

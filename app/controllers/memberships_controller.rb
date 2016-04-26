class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_create, only: :create
  before_action :authorize_destroy, only: :destroy

  def create
    # project refactored below
    # project = project.find params[:project_id]
    membership = Membership.new
    membership.user = current_user
    membership.project = project
    if membership.save
      #redirect_to project_path(@project)
      # project is a short form for project_path(@quesiton)
      redirect_to project, notice: "Joined the project!"
    else
      redirect_to project, alert: "You are already a member!"
    end

  end

  def destroy

    membership.destroy
    redirect_to project_path(membership.project_id), notice: "Left the project."
  end

  private

  def authorize_create
    # project is now the project method
    # can't membership your own project
    redirect_to project, notice: "It's your own project.  Can't become a member!" unless can? :become_member, project
  end

  def authorize_destroy
    redirect_to project, notice: "Can't Un-member Someone Else!" unless can? :destroy, membership
  end

  def project
    @project ||= Project.find params[:project_id]
  end

  def membership
    @membership ||= Membership.find params[:id]
  end

end

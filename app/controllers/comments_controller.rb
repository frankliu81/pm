class CommentsController < ApplicationController

  # no new action because the new form for comment
  # is right on the discussion page
  #def new
  #end

  def edit
    @discussion = Discussion.find params[:discussion_id]
    @comment = @discussion.comments.find(params[:id])
  end

  def update
    @discussion = Discussion.find params[:discussion_id]
    @comment = @discussion.comments.find(params[:id])

    if @comment.update comment_params
      redirect_to project_discussion_path(@discussion.project, @discussion), notice: "Discussion updated"
    else
      flash[:alert] = "Comment is not updated"
      redirect_to project_discussion_path(@discussion.project, @discussion), notice: "Discussion updated"
    end

  end

  def create
    @discussion = Discussion.find params[:discussion_id]

    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)

    # important association
    @comment.discussion = @discussion

    if @comment.save
      #render text: "SUCCESS"
      redirect_to project_discussion_path(@discussion.project, @discussion), notice: "Thanks for the comment"
    else
      #render text: "FAILURE"
      flash[:alert] = "Comment is not saved"
      redirect_to project_discussion_path(@discussion.project, @discussion)
    end
  end

  def destroy
    discussion = Discussion.find params[:discussion_id]
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to project_discussion_path(discussion.project, discussion), notice: "Comment deleted"
  end

private
  def comment_params
    comment_params = params.require(:comment).permit([:body])
  end

end

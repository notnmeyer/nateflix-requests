class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :authenticate_user!
  # before_action :check_admin, only: %i[destroy update edit]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.author = current_user

    @commentable.status = 'pending' if is_request_reopen

    if @comment.save && @commentable.save
      notice = 'Comment was successfully added.'
      notice = "Comment added and request set to 'pending'." if is_request_reopen

      redirect_to @commentable, notice:
    else
      redirect_to @commentable, alert: 'Failed to add comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_commentable
    @commentable = find_commentable
  end

  def find_commentable
    if params[:request_id].present?
      Request.find(params[:request_id])
    elsif params[:issue_id].present?
      Issue.find(params[:issue_id])
    end
  end

  def is_request_reopen
    params[:request_id].present? && params[:reopen_request]
  end
end

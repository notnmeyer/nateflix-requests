class CommentsController < ApplicationController
  before_action :set_request
  before_action :authenticate_user!
  # before_action :check_admin, only: %i[destroy update edit]

  def create
    @comment = @request.comments.new(comment_params)
    @comment.author = current_user

    @request.status = 'pending' if params[:reopen_request]

    if @comment.save && @request.save
      notice = 'Comment was successfully added.'
      notice = "Comment added and request set to 'pending'." if params[:reopen_request]

      redirect_to @request, notice:
    else
      render 'requests/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_request
    @request = Request.find(params[:request_id])
  end
end

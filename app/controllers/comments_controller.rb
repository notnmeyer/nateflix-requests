class CommentsController < ApplicationController
  before_action :set_request
  before_action :authenticate_user!
  # before_action :check_admin, only: %i[destroy update edit]

  def create
    @comment = @request.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to @request, notice: 'Comment was successfully added.'
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

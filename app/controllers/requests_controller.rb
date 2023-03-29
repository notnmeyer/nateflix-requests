class RequestsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy, :update, :edit]
  
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path, notice: "Request was successfully created."
    else
      redirect_to root_path, alert: "There was a problem submitting your request."
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to root_path, notice: "Request was successfully deleted."
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to root_path, notice: "Request was successfully updated."
    else
      redirect_to root_path, alert: "There was a problem updating your request."
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  private
    def request_params
      params.require(:request).permit(:title, :media_type, :notes, :status)
    end
end

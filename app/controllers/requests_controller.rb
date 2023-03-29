class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: %i[destroy update edit]

  def index
    @requests = Request.all
  end

  def show; end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to root_path, notice: 'Request was successfully created.'
    else
      redirect_to root_url, alert: "Problem(s) creating request: #{@request.errors.full_messages}"
    end
  end

  def destroy
    @request.destroy
    redirect_to root_path, notice: 'Request was successfully deleted.'
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to root_url(@request), notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  private

  def request_params
    params.require(:request).permit(:title, :media_type, :notes, :status)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end

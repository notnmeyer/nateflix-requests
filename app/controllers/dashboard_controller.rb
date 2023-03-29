class DashboardController < ApplicationController
  def index
    @requests = Request.all
    @request = Request.new
  end
end

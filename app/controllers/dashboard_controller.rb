class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = Request.all
    @request = Request.new

    @issues = Issue.all
    @issue = Issue.new
  end
end

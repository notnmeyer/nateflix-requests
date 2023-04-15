class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests_cutoff_days = 7
    @requests = Request.where('status = ? OR created_at > ?', 'pending', @requests_cutoff_days.days.ago)
    @request = Request.new

    @issues = Issue.all
    @issue = Issue.new
  end
end

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests_cutoff = 7.days.ago
    @requests = Request.where('status = ? OR created_at > ?', 'pending', @requests_cutoff)
    @request = Request.new

    @issues = Issue.all
    @issue = Issue.new
  end
end

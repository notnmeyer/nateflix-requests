class StatsController < ApplicationController
  def index
    @users = User.left_joins(:requests)
                 .select('users.*, COUNT(requests.id) AS request_count')
                 .group('users.id')
                 .order('request_count DESC')
  end
end

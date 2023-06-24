require 'test_helper'
require 'active_support/testing/time_helpers'

require_relative '../helpers/aws_helpers'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include AWSHelpers

  setup do
    stub_sns_client
    @request = create(:request)
    @user = @request.user
  end

  test 'should get dashboard' do
    sign_in @user
    get dashboard_url
    assert_response :success
  end

  test 'signed out user should not get dashboard' do
    get dashboard_url
    assert_redirected_to new_user_session_url
  end

  test 'dashboard index should not show old filled requests' do
    sign_in @user
    @title = 'some old request'

    travel_to 1.month.ago
    @blah = @user.requests.new(title: @title, media_type: 'tv', status: 'filled').save
    assert @blah
    travel_back

    get dashboard_url
    assert_response :success
    assert_not response.body.include?(@title)
  end

  test 'dashboard index should show old pending requests' do
    sign_in @user
    @title = 'some old request'

    travel_to 1.month.ago
    @blah = @user.requests.new(title: @title, media_type: 'tv', status: 'pending').save
    assert @blah
    travel_back

    get dashboard_url
    assert_response :success
    assert response.body.include?(@title)
  end
end

require 'test_helper'
require 'active_support/testing/time_helpers'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = create(:request)
  end

  test 'should get dashboard' do
    sign_in @request.user
    get dashboard_url
    assert_response :success
  end

  test 'signed out user should not get dashboard' do
    get dashboard_url
    assert_redirected_to new_user_session_url
  end

  test 'dashboard index should not show old filled requests' do
    sign_in @request.user
    @title = 'some old request'

    travel_to 1.month.ago
    @blah = Request.create(title: @title, media_type: 'tv', status: 'filled')
    travel_back

    get dashboard_url
    assert_response :success
    assert_not response.body.include?(@title)
  end
end

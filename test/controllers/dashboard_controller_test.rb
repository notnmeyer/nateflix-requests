require 'test_helper'
require 'active_support/testing/time_helpers'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @admin = create(:admin)
  end

  test 'should get dashboard' do
    [@user, @admin].each do |_user|
      sign_in _user
      get dashboard_url
      assert_response :success
    end
  end

  test 'signed out user should not get dashboard' do
    get dashboard_url
    assert_redirected_to new_user_session_url
  end

  test 'dashboard index should not show old filled requests' do
    @title = 'some old request'

    travel_to 1.month.ago
    @blah = Request.create(title: @title, media_type: 'tv', status: 'filled')
    travel_back

    sign_in @user
    get dashboard_url
    assert_response :success
    assert_not response.body.include?(@title)
  end
end

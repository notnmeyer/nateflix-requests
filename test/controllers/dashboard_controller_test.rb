require 'test_helper'

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
end

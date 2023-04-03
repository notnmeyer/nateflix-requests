require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @admin = create(:admin)
    @valid_attributes = { title: 'Ghostbusters', notes: '', media_type: 'movie' }
  end

  test 'should get index' do
    sign_in @user
    get requests_url
    assert_response :success
  end

  test 'should create request' do
    sign_in @user
    assert_difference('Request.count') do
      post requests_url, params: { request: @valid_attributes }
    end
    assert_redirected_to root_url
  end

  test 'should show request' do
    sign_in @user
    get request_url(requests(:ghostbusters))
    assert_response :success
  end

  test 'should get edit' do
    sign_in @admin
    get edit_request_url(requests(:ghostbusters))
    assert_response :success
  end

  test 'should update request' do
    sign_in @admin
    request = requests(:ghostbusters)
    patch request_url(request), params: { request: @valid_attributes }
    assert_redirected_to root_url
  end

  test 'should destroy request' do
    sign_in @admin
    assert_difference('Request.count', -1) do
      request = requests(:ghostbusters)
      delete request_url(request)
    end
    assert_redirected_to root_url
  end
end

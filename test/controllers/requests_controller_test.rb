require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = create(:request)
    sign_in @request.user
    @admin = create(:admin)
    @valid_attributes = { title: 'Casablanca', notes: '', media_type: 'movie' }
  end

  test 'should get index' do
    get requests_url
    assert_response :success
  end

  test 'should create request' do
    assert_difference('Request.count') do
      post requests_url, params: { request: @valid_attributes }
    end
    assert_redirected_to root_url
  end

  test 'should show request' do
    get request_url(@request)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @admin
    get edit_request_url(@request)
    assert_response :success
  end

  test 'should update request' do
    sign_in @admin
    patch request_url(@request), params: { request: @valid_attributes }
    assert_redirected_to root_url
  end

  test 'should destroy request' do
    sign_in @admin
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end
    assert_redirected_to root_url
  end
end

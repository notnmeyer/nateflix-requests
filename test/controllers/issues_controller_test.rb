require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @admin = create(:admin)
    @valid_attributes = { title: 'Ghostbusters', notes: 'german language', status: 'reported' }
  end

  test 'should get index' do
    sign_in @user
    get issues_url
    assert_response :success
  end

  test 'should create issue' do
    sign_in @user
    assert_difference('Issue.count') do
      post issues_url, params: { issue: @valid_attributes }
    end
    assert_redirected_to root_url
  end

  test 'should show issue' do
    sign_in @user
    get issue_url(issues(:one))
    assert_response :success
  end

  test 'should get edit' do
    sign_in @admin
    get edit_issue_url(issues(:one))
    assert_response :success
  end

  test 'should update issue' do
    sign_in @admin
    issue = issues(:one)
    patch issue_url(issue), params: { issue: @valid_attributes }
    assert_redirected_to root_url
  end

  test 'should destroy issue' do
    sign_in @admin
    assert_difference('Issue.count', -1) do
      issue = issues(:one)
      delete issue_url(issue)
    end
    assert_redirected_to root_url
  end
end

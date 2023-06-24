require 'test_helper'

require_relative '../helpers/aws_helpers'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  include AWSHelpers

  setup do
    stub_sns_client
    @user = create(:user)
    @admin = create(:admin)
    @valid_attributes = { title: 'Ghostbusters', notes: 'german language', status: 'reported' }
    @issue = create(:issue)
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
    get issue_url(@issue)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @admin
    get edit_issue_url(@issue)
    assert_response :success
  end

  test 'should update issue' do
    sign_in @admin
    patch issue_url(@issue), params: { issue: @valid_attributes }
    assert_redirected_to root_url
  end

  test 'should destroy issue' do
    sign_in @admin
    assert_difference('Issue.count', -1) do
      delete issue_url(@issue)
    end
    assert_redirected_to root_url
  end

  test 'should create comment' do
    sign_in @user
    assert_difference('Comment.count') do
      post issue_comments_url(@issue), params: { comment: { content: 'Test comment', issue_id: @issue } }
    end
    assert_redirected_to issue_path(@issue)
    follow_redirect!
    assert_select 'p', /Test comment/
  end
end

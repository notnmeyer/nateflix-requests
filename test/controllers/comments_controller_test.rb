require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @req = create(:request)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post request_comments_url(@req), params: { comment: { content: 'Test comment' } }
    end
    assert_redirected_to request_path(@req)
    follow_redirect!
    assert_select 'p', /Test comment/
  end

  test 'should not create comment with empty content' do
    assert_no_difference('Comment.count') do
      post request_comments_url(@req), params: { comment: { content: '' } }
    end

    assert_response :success
    assert_select 'div#error_explanation'
    assert_select 'li', 'Fill out this field' # Assuming the validation error message for empty content is "Content can't be blank"
  end
end

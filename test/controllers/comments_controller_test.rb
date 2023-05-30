require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @req = create(:request)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post request_comments_url(@req), params: { comment: { content: 'Test comment', request_id: @req } }
    end
    assert_redirected_to request_path(@req)
    follow_redirect!
    assert_select 'p', /Test comment/
  end

  test 'should reopen request' do
    @req.update(status: 'filled')
    post request_comments_url(@req), params: { comment: { content: 'Test comment' }, reopen_request: true }
    assert_redirected_to request_path(@req)
    follow_redirect!
    assert_select 'p', /Test comment/
    assert_select 'p', /Comment added and request set to 'pending'/

    @req.reload
    assert_equal 'pending', @req.status
  end
end

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
end

class BackfillCommentableForComments < ActiveRecord::Migration[7.0]
  def up
    Comment.find_each do |comment|
      if comment.request_id.present?
        comment.update(commentable_id: comment.request_id, commentable_type: 'Request')
      elsif comment.issue_id.present?
        comment.update(commentable_id: comment.issue_id, commentable_type: 'Issue')
      end
    end
  end

  def down; end
end

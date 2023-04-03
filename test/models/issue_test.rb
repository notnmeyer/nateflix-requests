require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  test 'invalid without title' do
    issue = Issue.new(notes: '', status: 'reported')
    assert_not issue.valid?
  end

  test 'notes can be blank' do
    issue = Issue.new(title: 'Test', notes: '', status: 'reported')
    assert issue.valid?
  end

  test 'status can be omitted' do
    issue = Issue.new(title: 'Test', notes: '')
    assert issue.valid?

    issue.save
    assert_equal 'reported', issue.status
  end
end

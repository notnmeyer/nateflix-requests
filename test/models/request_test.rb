require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test 'invalid without title' do
    request = Request.new(notes: '', status: 'pending')
    assert_not request.valid?
  end

  test 'notes can be blank' do
    request = Request.new(title: 'Test', notes: '', status: 'pending', media_type: 'tv')
    assert request.valid?
  end

  test 'invalid without media_type' do
    request = Request.new(title: 'Test', notes: '')
    assert_not request.valid?
  end

  test 'status can be omitted' do
    request = Request.new(title: 'Test', notes: '', media_type: 'tv')
    assert request.valid?

    request.save
    assert_equal 'pending', request.status
  end
end

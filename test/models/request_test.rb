require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @params = { title: 'Test', notes: 'some notes', status: 'pending', media_type: 'tv', user: @user }
  end

  test 'invalid without title' do
    @params[:title] = nil
    request = Request.new(@params)
    assert_not request.valid?
  end

  test 'notes can be blank' do
    @params[:notes] = nil
    request = Request.new(@params)
    assert request.valid?
  end

  test 'invalid without media_type' do
    @params[:media_type] = nil
    request = Request.new(@params)
    assert_not request.valid?
  end

  test 'status can be omitted' do
    @params = @params.except :status
    request = Request.new(@params)
    assert request.valid?

    request.save
    assert_equal 'pending', request.status
  end
end

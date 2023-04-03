require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'blah@example.com', password: 'password', password_confirmation: 'password')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'password', password_confirmation: 'password')
    assert_not user.valid?
  end

  test 'invalid without password' do
    user = User.new(email: 'blah@example.com')
    assert_not user.valid?
  end
end

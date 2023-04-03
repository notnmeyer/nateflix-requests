require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'valid admin' do
    admin = Admin.new(email: 'blah@example.com', password: 'password', password_confirmation: 'password')
    assert admin.valid?
  end

  test 'invalid without email' do
    admin = Admin.new(password: 'password', password_confirmation: 'password')
    assert_not admin.valid?
  end

  test 'invalid without password' do
    admin = Admin.new(email: 'blah@example.com')
    assert_not admin.valid?
  end
end

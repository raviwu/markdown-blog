require "test_helper"

class UserTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  should validate_presence_of(:username)
  should validate_presence_of(:email)
  should have_secure_password
end

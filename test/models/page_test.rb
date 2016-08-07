require "test_helper"

class PageTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  should belong_to(:user)
  should have_many(:images).dependent(:destroy)
  should validate_presence_of(:body)
  should validate_presence_of(:user)
end

# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  should belong_to(:user)
  should have_many(:images).dependent(:destroy)
  should validate_presence_of(:body)
  should validate_presence_of(:user)
end

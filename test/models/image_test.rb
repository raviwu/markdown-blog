require "test_helper"

class ImageTest < ActiveSupport::TestCase
  should belong_to(:entry)
  should validate_presence_of(:entry)
end

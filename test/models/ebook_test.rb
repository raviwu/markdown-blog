require "test_helper"

class EbookTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  should belong_to(:user)
  should have_one(:image).dependent(:destroy)
  should have_many(:attachments).dependent(:destroy)
  should validate_presence_of(:introduction)
  should validate_presence_of(:user)

  test "return reference_infos in array" do
    ebook = Ebook.create(
      title: "Ebook Title",
      user: create(:user),
      references: "description1|url1,description2|url2"
    )
    expected_info_output = [
      { url: "url1", description: "description1" },
      { url: "url2", description: "description2" }
    ]
    assert_equal ebook.reference_infos, expected_info_output
  end
end

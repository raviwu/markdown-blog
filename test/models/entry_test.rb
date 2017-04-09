# frozen_string_literal: true

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  should belong_to(:user)
  should validate_presence_of(:title)
  should validate_presence_of(:user)

  test 'should assign published_at' do
    entry = Entry.create(title: 'Entry title', user: create(:user))
    assert_equal entry.published_at.present?, true
  end

  test 'should assign slug' do
    entry = Entry.create(title: 'Entry title', user: create(:user))
    assert_equal entry.slug.present?, true
  end

  test 'should assign author_name' do
    entry = Entry.create(title: 'Entry title', user: create(:user))
    assert_equal entry.author_name, entry.user.username
  end
end

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "title is required" do
    book = Book.new(title: '', author: 'example')
    assert_not book.valid?
  end

  test "author is required" do
    book = Book.new(title: 'example', author: '')
    assert_not book.valid?
  end

  # search_for
  #  - I am just testing that the configuration works.
  #    - there is no point re-testing pg_search

  test "search_for - returns matches" do
    book = Book.create(title: 'example', author: 'user')
    results = Book.search_for('example')
    assert_equal(results, [book])
  end

  test "#search_for - returns empty if no matches" do
    Book.create(title: 'example', author: 'user')
    results = Book.search_for('missing')
    assert_equal(results, [])
  end
end

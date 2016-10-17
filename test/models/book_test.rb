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
end

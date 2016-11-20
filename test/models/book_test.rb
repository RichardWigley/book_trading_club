# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # validates presence
  #
  [:author, :title].each do |method_name|
    test "##{method_name} is required" do
      @book = Book.new(title: 'Emma', author: 'Jane Austin')

      @book.public_send("#{method_name}=", nil)

      refute @book.valid?
      assert_includes @book.errors[method_name], "can't be blank",
                      "no validation error for #{method_name} present"
    end
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

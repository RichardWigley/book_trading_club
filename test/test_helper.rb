ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'
require 'capybara-screenshot/minitest'

require 'minitest/around'
require 'database_cleaner'
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

class Capybara::Rails::TestCase
  self.use_transactional_tests = false
  around do |tests|
    DatabaseCleaner.cleaning(&tests)
  end
end

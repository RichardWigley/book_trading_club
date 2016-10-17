# populate
#  - this is a demo application
#  - taks to fake some data on the fly to make it more interesting
#
namespace :db do
  desc 'Erase and fill database with fake data'
  task populate: :environment do
    require 'faker'

    [Book].each(&:delete_all)

    30.times do
      Book.create(title: Faker::Book.title, author: Faker::Book.author)
    end
  end
end

#comment out config.use_transactional_fixtures in rails/helper.rb This is configured in this file
#add gem 'database_cleaner' to the test group and bundle

require 'database_cleaner'

RSpec.configure do |config|

  config.use_transactional_fixtures = false
 
  # Empty the database before each test file
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
 
  config.before(:each) do
    DatabaseCleaner.start
  end
 
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
# RSpec configuration for factory girl
# spec/support/factory_girl.rb
# add gem 'factory_girl' to test Gemfile and bundle
# using gem 'database_cleaner' see support/database_cleaner.rb
# Documentation for Factory Girl gem can be found @ http://www.rubydoc.info/gems/factory_girl/index 

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start 
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
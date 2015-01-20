#This configuration includes methods, to be used in features spec, in support/feature/session_helpers.rb 
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end
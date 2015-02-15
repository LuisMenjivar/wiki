#to use email_specs: add gem 'email_spec' to the Gemfile and bundle
#Documention for email_specs can be found in https://github.com/bmabey/email-spec 

require 'email_spec'

RSpec.configure do |config|

  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

end

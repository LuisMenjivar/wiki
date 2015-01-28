module ValidUserRequestHelper
  # include Devise::TestHelpers
  def sign_in_as_a_valid_user
    @user = FactoryGirl.create :user
    #generate a valid user for us
    # We action the login request using the parameters before we begin.
    # The login requests will match these to the user we just created in the factory, and authenticate us.
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end
end
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ValidUserRequestHelper, type: :request
end
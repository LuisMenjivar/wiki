require 'rails_helper'

feature 'Premium Subscription' do
  scenario 'User signs up for premium wikys', js: true, slow: true  do
    user = User.new(id: 1, email: "test@example.com", password: "helloworld")
    sign_up(user.email, user.password) #sign_up method in support/features/session_helpers
    expect(user.reload.role).to eq("standard")
    visit new_charge_path
    click_button "Subscribe Now"
    sleep(5) # allows stripe_checkout_app frame to load
    
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      fill_in 'email', with: user.email
      fill_in 'card_number', with: "4242424242424242"
      fill_in 'cc-exp', with: "12/23"
      fill_in 'cc-csc', with: "123"
      click_button "submitButton"
      sleep(5) # allows stripe_checkout_app to submit
      expect(page).to have_content("Welcome")
      expect(user.reload.role).to eq("premium")
    end
  end
end


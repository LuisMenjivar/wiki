require 'rails_helper'

feature "sign up" do 
  let(:user) { build(:user) }
  scenario "successfully" do 
    reset_mailer
    sign_up(user.email, user.password)#sign_up method in support/features/sessionhelper.rb
    expect(page).to have_text("Welcome! You have signed up successfully. Welcome to wiki")
    expect(unread_emails_for(user.email).count).to eq(1)
    open_email(user.email)
    expect(current_email).to have_body_text("You can confirm your account email through the link below")
    click_first_link_in_email
    expect(page).to have_content('Your email address has been successfully confirmed')
  end
end
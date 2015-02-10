require 'rails_helper'
feature "user modifies a wiki's collaborator" do   
  before do
    user = create(:user, role: "premium")
    user.update(role: "premium")
    @wiki = create(:wiky, user: user)
    sign_in(user.email, user.password)
    visit edit_wiky_path(@wiki)
  end
  scenario "User adds and removes a given wiki's collaborator" do 
    collaborator = create(:user, email: 'collaborator@example.com')
    fill_in 'Collaborator Email', with: collaborator.email
    click_button "Add Collaborator"
    expect(current_path).to eq(edit_wiky_path(@wiki))
    expect(page).to have_css(
      "tr td:nth-child(1)", text: collaborator.email) 
    click_link "Destroy"
    expect(page).to_not have_css(
      "tr td:nth-child(1)", text: collaborator.email)
  end
  scenario "User is not allowed to add an collaborator with a unvalid email" do 
    visit edit_wiky_path(@wiki)
    fill_in 'Collaborator Email', with: 'email_not_in_database@example.com'
    click_button 'Add Collaborator'
    expect(page).to have_content("The email you typed is not in our database!")
  end
end


require 'rails_helper'
feature "user adds collaborator to wiky" do   
  before do
    user = create(:user, role: "premium")
    user.update(role: "premium")
    @wiky = create(:wiky, user: user)
    sign_in(user.email, user.password)
    visit edit_wiky_path(@wiky)
  end
  scenario "successfuly" do
    collaborator = create(:user, email: 'collaborator@example.com')
    fill_in 'Collaborator Email', with: collaborator.email
    click_button "Add Collaborator"
    expect(current_path).to eq(edit_wiky_path(@wiky))
    expect(page).to have_css(
      "tr td:nth-child(1)", text: collaborator.email) 
  end
  scenario "unsuccessfuly" do 
    visit edit_wiky_path(@wiky)
    fill_in 'Collaborator Email', with: 'email_not_in_database@example.com'
    click_button 'Add Collaborator'
    expect(page).to have_content("The email you typed is not in our database!")
  end
end


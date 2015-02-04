require 'rails_helper'
feature "user adds collaboaror to wiky" do  
  scenario "successfuly" do
    collaborator = create(:user, email: 'collaborator@example.com')
    user = create(:user)
    wiky = create(:wiky, user: user)
    sign_in(user.email, user.password)
    visit edit_wiky_path(wiky)
    fill_in 'Collaborator Email', with: collaborator.email
    click_button "Add Collaborator"

    expect(current_path).to eq(edit_wiky_path(wiky))
    expect(page).to have_css(
      "#collaborators tr:nth-child(2) td", text: collaborator.email
    )
  end
end


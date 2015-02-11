require 'rails_helper'
feature 'Standard user collaboraration' do
  before do
    premium_user = create(:user, role: "premium")
    premium_user.update(role: "premium")
    @wiki = create(
    :wiky, user: premium_user, public: false, title: "Valid Title")
    
    @standard_user = create(:user)
    sign_in(@standard_user.email, @standard_user.password)
  end
  scenario "User is only allowed to view an index with 
            private wikies he/she is a collaborator for" do     
    visit wikies_path
    expect(page).not_to have_text(@wiki.title)
    @wiki.collaborations.create!(user_id: @standard_user.id)
    visit wikies_path  
    expect(page).to have_text(@wiki.title)
  end
  scenario "Standard user is allowed to edit private wikys
            he/she is a collaborator for " do 
    @wiki.collaborations.create!(user_id: @standard_user.id)
    visit wikies_path
    click_link 'Edit'
    fill_in "Title", with: "Updated Valid Title"
    click_button "Update Wiky"
    visit wiky_path(@wiki)
    expect(page).to have_text("Updated Valid Title")
  end
end



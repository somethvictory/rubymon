require 'rails_helper'

feature 'Monster', type: :request do
  given!(:user) { create(:user) }

  before do
    login_as(user)
    create(:monster_type)
  end

  scenario 'user creates a new monster' do
    visit new_monster_path

    fill_in 'Name', with: 'Aly'
    fill_in 'Power', with: 'Very Strong'
    select  'Fire', from: 'Monster type'

    click_button 'Create Monster'

    expect(page).to have_content('Successfully created')
  end

  scenario 'user edit a monster' do
    monster = create(:monster, name: 'Aly', power: 'Very Strong', monster_type: create(:monster_type, name: 'Water'), user: user)
    visit edit_monster_path(monster)

    fill_in 'Name', with: 'New Name'
    fill_in 'Power', with: 'Super Strong'
    select  'Water', from: 'Monster type'

    click_button 'Update Monster'

    expect(page).to have_content('Successfully updated')
    expect(page).to have_content('New Name')
    expect(page).to have_content('Super Strong')
    expect(page).to have_content('Water')
  end
end

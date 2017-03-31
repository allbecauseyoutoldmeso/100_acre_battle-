feature 'Battle' do
# capybara
  before do
    sign_in_and_play
  end

  scenario 'Entering player details' do
      expect(page).to have_content 'Emily vs. Jessica'
  end

  scenario 'View player hit points' do
      expect(page).to have_content 'Jessica: 10HP'
  end

  scenario 'Attack Player 2' do
      click_link 'Attack'
      expect(page).to have_content 'Emily attacked Jessica'
  end

  scenario 'Player 2 hp reduced' do
    click_link 'Attack'
    expect(page).not_to have_content 'Jessica: 10HP'
    expect(page).to have_content 'Jessica: 8HP'
  end

  scenario 'Player 2 has a turn' do
    click_link 'Attack'
    click_button 'Revenge!'
    expect(page).to have_content 'Jessica vs. Emily'
  end

  scenario 'Viewing hit points after attack' do
    click_link 'Attack'
    click_button 'Damage review'
    expect(page).to have_content 'Emily: 10HP Jessica: 8HP'
  end
end

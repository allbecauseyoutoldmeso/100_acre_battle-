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
end

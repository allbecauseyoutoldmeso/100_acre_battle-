feature 'Battle' do
# capybara
  before do
    sign_in_and_play
  end

  scenario 'Entering player details' do
      expect(page).to have_content 'Emily vs. Alice'
  end

  scenario 'View player hit points' do
      expect(page).to have_content 'Emily: 10HP'
  end

  scenario 'Attack Player 2' do
      click_link 'Attack'
      expect(page).to have_content 'Emily attacked Alice'
  end

end

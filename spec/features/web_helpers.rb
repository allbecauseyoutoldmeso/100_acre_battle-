def sign_in_and_play
  visit('/')
  fill_in :player_1, :with => 'Emily'
  fill_in :player_2, :with => 'Jessica'
  click_button 'Submit'
end

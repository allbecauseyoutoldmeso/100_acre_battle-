describe Battle do

  feature 'Homepage' do
    scenario 'says "Testing infrastructure working"' do
      visit('/')
      expect(page).to have_content("Testing infrastructure working")
    end



  end



end

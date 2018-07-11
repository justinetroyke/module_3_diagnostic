require 'rails_helper'

feature "User can search" do
  scenario "User fills in search form and is taken to /search" do
    zip = 80203

    visit '/'

    within(".navbar") do
      fill_in "q", with: zip
      click_on "Locate"
    end

    expect(page).to have_current_path('/search')
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

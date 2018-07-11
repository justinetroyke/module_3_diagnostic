require 'rails_helper'

feature "User can search" do
  scenario "User fills in search form and is taken to /search with 10 results" do
    zip = 80203
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    # And I click "Locate"
    within(".navbar") do
      fill_in "q", with: zip
      click_on "Locate"
    end
    # Then I should be on page "/search"
    expect(current_path).to eq "/search"
    expect(page).to have_content("Stations Near Zip Code")
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    results = Search.last.station

    expect(results.count).to eq(10)
  end
end

# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

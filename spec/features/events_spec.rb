require "rails_helper"

feature 'browse homepage', :devise do
  scenario 'user can see events' do
    visit root_path
    expect(page).to have_content "Discover upcoming events"
  end
end

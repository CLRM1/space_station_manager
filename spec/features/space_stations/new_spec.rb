require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays a link that creates a new space station and redirects to the space station index' do
    visit '/space_stations'
    expect(page).to have_link('New Space Station')
    click_link 'New Space Station'
    expect(current_path).to eq('/space_stations/new')
    fill_in 'name', with: 'Denver Space Station'
    fill_in 'habitable', with: true
    fill_in 'max_occupants', with: 20
    click_on 'Create Space Station'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content('Denver Space Station')
  end
end

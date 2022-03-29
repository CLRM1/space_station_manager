require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays a link to update the astronaut attributes' do
    visit "astronauts/#{@walker.id}"
    expect(page).to have_link('Update Astronaut')
    click_link 'Update Astronaut'
    expect(current_path).to eq("/astronauts/#{@walker.id}/edit")
    fill_in 'name', with: 'Sally Ride'
    fill_in 'active', with: false
    fill_in 'years_active', with: 15
    click_on 'Save'
    expect(current_path).to eq("/astronauts/#{@walker.id}")
  end
end

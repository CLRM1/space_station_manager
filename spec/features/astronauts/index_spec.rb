require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
    @hadfield = Astronaut.create!(name: 'Chris Hadfield', active: true, years_active: 7, space_station_id: @station.id)
  end

  it 'displays each astronaut in the system including the astronauts attributes' do
    visit "/astronauts"
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@walker.active)
    expect(page).to have_content(@walker.years_active)
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit "/astronauts"
    expect(page).to have_link('Astronauts')
    click_link 'Astronauts'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/astronauts"
    expect(page).to have_link('Space Stations')
    click_link 'Space Stations'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays only true astronaut records' do
    visit "/astronauts"
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@hadfield.name)
    expect(page).to_not have_content(@kelly.name)
  end

  it 'displays a link to update each astronaut' do
    Astronaut.destroy_all
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    visit '/astronauts'
    click_link 'Update'
    expect(current_path).to eq("/astronauts/#{@walker.id}/edit")
    fill_in 'name', with: 'Captain Kirk'
    fill_in 'active', with: true
    fill_in 'years_active', with: 40
    click_on 'Save'
    expect(current_path).to eq("/astronauts/#{@walker.id}")
    expect(page).to have_content('Captain Kirk')
  end

  it 'displays a link to delete each astronaut' do
    Astronaut.destroy_all
    @hadfield = Astronaut.create!(name: 'Chris Hadfield', active: true, years_active: 7, space_station_id: @station.id)
    visit '/astronauts'
    expect(page).to have_content(@hadfield.name)
    click_on 'Delete'
    expect(current_path).to eq('/astronauts')
    expect(page).to_not have_content(@hadfield.name)
  end
end

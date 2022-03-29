require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
    @hadfield = Astronaut.create!(name: 'Chris Hadfield', active: true, years_active: 7, space_station_id: @station.id)
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays name of each astronaut and their attributes for a station' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@walker.active)
    expect(page).to have_content(@walker.years_active)
    expect(page).to have_content(@kelly.name)
    expect(page).to have_content(@kelly.active)
    expect(page).to have_content(@kelly.years_active)
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays a link to create a new astronaut for the selected space station' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Create Astronaut')
    click_link 'Create Astronaut'
    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts/new")

    fill_in 'name', with: 'Buzz Lightyear'
    fill_in 'active', with: true
    fill_in 'years_active', with: 25
    click_on 'Create Astronaut'

    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts")
    expect(page).to have_content('Buzz Lightyear')
  end

  it 'displays a link that sorts the astronauts in alphabetical order' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Sort Alphabetically')
    click_link 'Sort Alphabetically'
    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts")
    expect(page.text.index('Chris Hadfield')).to be < page.text.index('Neil Armstrong')
  end

it 'displays a link to update each astronaut' do
  visit "/space_stations/#{@station.id}/astronauts"
  click_link "Update Astronaut: #{@walker.name}"
  expect(current_path).to eq("/astronauts/#{@walker.id}/edit")
  fill_in 'name', with: 'Captain Kirk'
  fill_in 'active', with: true
  fill_in 'years_active', with: 40
  click_on 'Save'
  expect(current_path).to eq("/astronauts/#{@walker.id}")
  expect(page).to have_content('Captain Kirk')
end
end

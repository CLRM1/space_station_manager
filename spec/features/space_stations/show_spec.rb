require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', active: false, years_active: 10, space_station_id: @station_2.id)
  end

  it 'displays the attributes of a specific space station' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station.habitable)
    expect(page).to have_content(@station.max_occupants)
  end

  it 'displays the count of astronauts associated with the space station' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_content("Number of astronauts: 2")
    visit "/space_stations/#{@station_2.id}"
    expect(page).to have_content("Number of astronauts: 1")
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays a link to the astronauts on a space station show page' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_link('Astronauts')
    click_link 'Astronauts'
    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts")
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@kelly.name)
  end
  it 'displays a link to update the space station on a space station show page' do
    visit "/space_stations/#{@station.id}"
    expect(page). to have_link('Update Space Station')
    click_link 'Update Space Station'
    expect(current_path).to eq("/space_stations/#{@station.id}/edit")

    fill_in 'name', with: 'Japanese Space Station'
    fill_in 'habitable', with: false
    fill_in 'max_occupants', with: 30
    click_on 'Save'

    expect(current_path).to eq("/space_stations/#{@station.id}")
    expect(page).to have_content('Japanese Space Station')
  end

  # As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
  it 'displays a link to delete the space station' do
    visit "/space_stations/#{@station.id}"
    click_link 'Delete Space Station'
    expect(current_path).to eq('/space_stations')
    expect(page).to_not have_content(@station.name)
  end
end

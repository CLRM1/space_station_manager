require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
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
    expect(page).to have_content(@kelly.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

#   User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

  it 'displays a link to create a new astronaut for the selected space station' do
    visit "/space_stations/#{@station.id}/astronauts"
    expect(page).to have_link('Create Astronaut')
    click_link 'Create Astronaut'
    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts/new")

    fill_in 'name', with: 'Canadian Space Station'
    fill_in 'habitable', with: false
    fill_in 'max_occupants', with: 100
    click_on 'Create Astronaut'
    expect(current_path).to eq("/space_stations/#{@station.id}/astronauts")
    expect(page).to have_content('Canadian Space Station')
  end
end

require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays the names of each space_station' do
    visit '/space_stations'
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays the space_stations by most recently created' do
    visit '/space_stations'
    expect(page.text.index("ESA")).to be < page.text.index("ISS")
    expect(page).to have_content(@station_2.name)
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station.created_at)
    expect(page).to have_content(@station_2.created_at)
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit '/space_stations'
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit '/space_stations'
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays a link next to each space station to edit the space station' do
    Astronaut.destroy_all
    SpaceStation.destroy_all
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    visit '/space_stations'
    click_link "Update"
    expect(current_path).to eq("/space_stations/#{@station.id}/edit")

    fill_in 'name', with: 'Costa Rican Space Station'
    fill_in 'habitable', with: true
    fill_in 'max_occupants', with: 20
    click_on 'Save'

    expect(current_path).to eq("/space_stations/#{@station.id}")
    expect(page).to have_content('Costa Rican Space Station')
  end

  it 'displays a link to delete each parent' do
    Astronaut.destroy_all
    SpaceStation.destroy_all
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    visit '/space_stations'
    expect(page).to have_content(@station.name)
    click_on 'Delete'
    expect(current_path).to eq('/space_stations')
    expect(page).to_not have_content(@station.name)
  end
end

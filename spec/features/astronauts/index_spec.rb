require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10,
                                space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7,
                                space_station_id: @station.id)
  end

  it 'displays each astronaut in the system including the astronauts attributes' do
    visit '/astronauts'
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@walker.active)
    expect(page).to have_content(@walker.years_active)
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit '/astronauts'
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit '/astronauts'
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

#   User Story 15, Child Index only shows `true` Records
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
  it 'only displays astronauts with true records' do
    visit '/astronauts'
    expect(page).to have_content(@walker.name)
    expect(page).to_not have_content(@kelly.name)
  end
end

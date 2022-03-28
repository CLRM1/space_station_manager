require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays the attributes a single astronaut' do
    visit "/astronauts/#{@walker.id}"
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@walker.active)
    expect(page).to have_content(@walker.years_active)
  end

  it 'displays a link at the top of the page that takes me to the astronauts index' do
    visit "/astronauts/#{@walker.id}"
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
    expect(page).to have_content(@kelly.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/astronauts/#{@walker.id}"
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
    expect(current_path).to eq('/space_stations')
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

#   User Story 14, Child Update
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
  it 'displays a link to update the astronaut attributes' do
    visit "astronauts/#{@walker.id}"
    expect(page).to have_link('Update Astronaut')
    click_link 'Update Astronaut'
    expect(current_path).to eq("astronauts/#{@walker.id}/edit")
    fill_in 'name', with: 'Sally Ride'
    fill_in 'active', with: false
    fill_in 'years_active', with: 15
    click_link 'Save'
    expect(current_path).to eq("astronauts/#{@walker.id}")
  end
end

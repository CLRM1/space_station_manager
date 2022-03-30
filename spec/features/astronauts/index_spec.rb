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
    expect(page).to have_link('Astronaut Index')
    click_link 'Astronaut Index'
    expect(current_path).to eq('/astronauts')
    expect(current_path).to eq('/astronauts')
    expect(page).to have_content(@walker.name)
  end

  it 'displays a link at the top of the page that takes me to the space stations index' do
    visit "/astronauts"
    expect(page).to have_link('Space Station Index')
    click_link 'Space Station Index'
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
    visit '/astronauts'
    click_link "Update Astronaut: #{@walker.name}"
    expect(current_path).to eq("/astronauts/#{@walker.id}/edit")
    fill_in 'name', with: 'Captain Kirk'
    fill_in 'active', with: true
    fill_in 'years_active', with: 40
    click_on 'Save'
    expect(current_path).to eq("/astronauts/#{@walker.id}")
    expect(page).to have_content('Captain Kirk')
  end

#   User Story 23, Child Delete From Childs Index Page
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child
  describe 'delete astronaut' do
    it 'displays a link to delete each astronaut' do
      Astronaut.destroy_all
      SpaceStation.destroy_all
      @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
      @hadfield = Astronaut.create!(name: 'Chris Hadfield', active: true, years_active: 7, space_station_id: @station.id)
      visit '/astronauts'
      expect(page).to have_content(@hadfield.name)
      click_on 'Delete Astronaut'
      expect(current_path).to eq('/astronauts')
      expect(page).to_not have_content(@hadfield.name)
    end
  end
end

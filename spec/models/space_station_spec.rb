require 'rails_helper'

RSpec.describe SpaceStation, type: :model do
  it 'has attributes' do
    station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    expect(station).to be_a(SpaceStation)
  end
end

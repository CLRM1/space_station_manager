require 'rails_helper'

RSpec.describe SpaceStation, type: :model do
  describe 'relationships' do
    it { should have_many :astronauts }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :max_occupants}
  end

end

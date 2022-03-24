require 'rails_helper'

RSpec.describe Astronaut, type: :model do
  describe 'relationships' do
    it { should belong_to :space_station }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :years_active}
    it { should allow_value(true).for(:active) }
    it { should allow_value(false).for(:active) }
  end

end

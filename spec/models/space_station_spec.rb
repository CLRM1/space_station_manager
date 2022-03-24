require 'rails_helper'

RSpec.describe SpaceStation, type: :model do
  describe 'relationships' do
    it { should have_many :astronauts }
  end

end

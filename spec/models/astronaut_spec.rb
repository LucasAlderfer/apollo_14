require 'rails_helper'

describe Astronaut, type: :model do
  describe 'instance methods' do
    it 'should generate the total time in space' do
      astronaut = Astronaut.create!(name: 'Mark', age: 60, job: 'space rookie')
      space_mission_1 = astronaut.space_missions.create!(title: 'a mission', trip_length: 15)
      space_mission_2 = astronaut.space_missions.create!(title: 'b mission', trip_length: 100)

      expect(astronaut.time_in_space).to eq(115)
    end
  end
end

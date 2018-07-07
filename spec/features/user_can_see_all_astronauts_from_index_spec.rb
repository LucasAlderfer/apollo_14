require 'rails_helper'

describe 'visiting /astronauts' do
  context 'as a visitor' do
    it 'should list all astronauts' do
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 27, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 28, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 29, job: 'space rookie')

      visit '/astronauts'

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_1.age)
      expect(page).to have_content(astronaut_1.job)
      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content(astronaut_2.age)
      expect(page).to have_content(astronaut_2.job)
      expect(page).to have_content(astronaut_3.name)
      expect(page).to have_content(astronaut_3.age)
      expect(page).to have_content(astronaut_3.job)
    end
    it 'should show the average age of all astronauts.' do
      Astronaut.destroy_all
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 30, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 90, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 60, job: 'space rookie')
      expected = 60
      visit '/astronauts'

      expect(page).to have_content("Average Age: #{expected}")
    end
    it 'should list the space missions for each astronaut in alphabetical order' do
      Astronaut.destroy_all
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 30, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 90, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 60, job: 'space rookie')
      space_mission_1 = astronaut_1.space_missions.create!(title: 'a mission', trip_length: 15)
      space_mission_2 = astronaut_1.space_missions.create!(title: 'b mission', trip_length: 100)
      space_mission_3 = astronaut_2.space_missions.create!(title: 'c mission', trip_length: 17)
      space_mission_4 = astronaut_2.space_missions.create!(title: 'd mission', trip_length: 90)
      space_mission_5 = astronaut_3.space_missions.create!(title: 'e mission', trip_length: 80)
      space_mission_6 = astronaut_3.space_missions.create!(title: 'f mission', trip_length: 24)

      visit '/astronauts'

      expect(page).to have_content("a mission")
      expect(page).to have_content("b mission")
      expect(page).to have_content("c mission")
      expect(page).to have_content("d mission")
      expect(page).to have_content("e mission")
      expect(page).to have_content("f mission")
    end
    it 'should show the total time in space for each astronaut.' do
      Astronaut.destroy_all
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 30, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 90, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 60, job: 'space rookie')
      space_mission_1 = astronaut_1.space_missions.create!(title: 'a mission', trip_length: 15)
      space_mission_2 = astronaut_1.space_missions.create!(title: 'b mission', trip_length: 100)
      space_mission_3 = astronaut_2.space_missions.create!(title: 'c mission', trip_length: 17)
      space_mission_4 = astronaut_2.space_missions.create!(title: 'd mission', trip_length: 90)
      space_mission_5 = astronaut_3.space_missions.create!(title: 'e mission', trip_length: 80)
      space_mission_6 = astronaut_3.space_missions.create!(title: 'f mission', trip_length: 24)
      expected_1 = 115
      expected_2 = 107
      expected_3 = 104

      visit '/astronauts'

      expect(page).to have_content("Total Time in Space: #{expected_1}")
      expect(page).to have_content("Total Time in Space: #{expected_2}")
      expect(page).to have_content("Total Time in Space: #{expected_3}")
    end
  end
end

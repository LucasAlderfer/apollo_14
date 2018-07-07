class SpaceMission < ApplicationRecord
  has_many :astronaut_space_missions
  has_many :astronauts, through: :astronaut_space_missions
end

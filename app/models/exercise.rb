class Exercise < ApplicationRecord
  has_many :equipment_exercises
  has_many :equipment, through: :equipment_exercises

  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end

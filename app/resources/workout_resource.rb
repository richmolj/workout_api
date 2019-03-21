class WorkoutResource < ApplicationResource
  attribute :name, :string

  has_many :equipment, foreign_key: :workout_id do
    assign_each do |workout, equipment|
      equipment.select do |e|
        workout_ids = e.exercises.map(&:workout_exercises).flatten.map(&:workout_id)
        workout.id.in?(workout_ids)
      end
    end
  end
end

class EquipmentResource < ApplicationResource
  attribute :name, :string

  filter :workout_id, :integer do
    eq do |scope, value|
      scope
        .eager_load(exercises: :workout_exercises)
        .merge(WorkoutExercise.where(workout_id: value))
    end
  end
end

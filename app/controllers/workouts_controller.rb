class WorkoutsController < ApplicationController
  def index
    workouts = WorkoutResource.all(params)
    respond_with(workouts)
  end

  def show
    workout = WorkoutResource.find(params)
    respond_with(workout)
  end

  def create
    workout = WorkoutResource.build(params)

    if workout.save
      render jsonapi: workout, status: 201
    else
      render jsonapi_errors: workout
    end
  end

  def update
    workout = WorkoutResource.find(params)

    if workout.update_attributes
      render jsonapi: workout
    else
      render jsonapi_errors: workout
    end
  end

  def destroy
    workout = WorkoutResource.find(params)

    if workout.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: workout
    end
  end
end

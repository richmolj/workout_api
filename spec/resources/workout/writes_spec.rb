require 'rails_helper'

RSpec.describe WorkoutResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'workouts',
          attributes: attributes_for(:workout).
            except("created_at", "updated_at")
        }
      }
    end

    let(:instance) do
      WorkoutResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Workout.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:workout) { create(:workout) }

    let(:payload) do
      {
        data: {
          id: workout.id.to_s,
          type: 'workouts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WorkoutResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { workout.reload.updated_at }
      # .and change { workout.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:workout) { create(:workout) }

    let(:instance) do
      WorkoutResource.find(id: workout.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Workout.count }.by(-1)
    end
  end
end

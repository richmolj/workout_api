require 'rails_helper'

RSpec.describe "workouts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/workouts/#{workout.id}"
  end

  describe 'basic destroy' do
    let!(:workout) { create(:workout) }

    it 'updates the resource' do
      expect(WorkoutResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Workout.count }.by(-1)
      expect { workout.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

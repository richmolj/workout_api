require 'rails_helper'

RSpec.describe "workouts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/workouts/#{workout.id}", payload
  end

  describe 'basic update' do
    let!(:workout) { create(:workout) }

    let(:payload) do
      {
        data: {
          id: workout.id.to_s,
          type: 'workouts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(WorkoutResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { workout.reload.attributes }
    end
  end
end

require 'rails_helper'

RSpec.describe "workouts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/workouts", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:workout).
        except("created_at", "updated_at")
    end
    let(:payload) do
      {
        data: {
          type: 'workouts',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(WorkoutResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Workout.count }.by(1)
    end
  end
end

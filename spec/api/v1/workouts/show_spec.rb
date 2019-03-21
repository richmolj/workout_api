require 'rails_helper'

RSpec.describe "workouts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workouts/#{workout.id}", params: params
  end

  describe 'basic fetch' do
    let!(:workout) { create(:workout) }

    it 'works' do
      expect(WorkoutResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('workouts')
      expect(d.id).to eq(workout.id)
    end
  end
end

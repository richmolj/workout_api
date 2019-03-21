require 'rails_helper'

RSpec.describe "workouts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workouts", params: params
  end

  describe 'basic fetch' do
    let!(:workout1) { create(:workout) }
    let!(:workout2) { create(:workout) }

    it 'works' do
      expect(WorkoutResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['workouts'])
      expect(d.map(&:id)).to match_array([workout1.id, workout2.id])
    end
  end
end

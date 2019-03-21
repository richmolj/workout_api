require 'rails_helper'

RSpec.describe "equipment#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/equipment/#{equipment.id}", params: params
  end

  describe 'basic fetch' do
    let!(:equipment) { create(:equipment) }

    it 'works' do
      expect(EquipmentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('equipment')
      expect(d.id).to eq(equipment.id)
    end
  end
end

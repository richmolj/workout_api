require 'rails_helper'

RSpec.describe "equipment#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/equipment", params: params
  end

  describe 'basic fetch' do
    let!(:equipment1) { create(:equipment) }
    let!(:equipment2) { create(:equipment) }

    it 'works' do
      expect(EquipmentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['equipment'])
      expect(d.map(&:id)).to match_array([equipment1.id, equipment2.id])
    end
  end
end

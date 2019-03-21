require 'rails_helper'

RSpec.describe "equipment#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/equipment/#{equipment.id}"
  end

  describe 'basic destroy' do
    let!(:equipment) { create(:equipment) }

    it 'updates the resource' do
      expect(EquipmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Equipment.count }.by(-1)
      expect { equipment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

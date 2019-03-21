require 'rails_helper'

RSpec.describe "equipment#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/equipment/#{equipment.id}", payload
  end

  describe 'basic update' do
    let!(:equipment) { create(:equipment) }

    let(:payload) do
      {
        data: {
          id: equipment.id.to_s,
          type: 'equipment',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EquipmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { equipment.reload.attributes }
    end
  end
end

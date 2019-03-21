require 'rails_helper'

RSpec.describe "equipment#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/equipment", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:equipment).
        except("created_at", "updated_at")
    end
    let(:payload) do
      {
        data: {
          type: 'equipment',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EquipmentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Equipment.count }.by(1)
    end
  end
end

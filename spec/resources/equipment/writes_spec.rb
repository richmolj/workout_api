require 'rails_helper'

RSpec.describe EquipmentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'equipment',
          attributes: attributes_for(:equipment).
            except("created_at", "updated_at")
        }
      }
    end

    let(:instance) do
      EquipmentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Equipment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:equipment) { create(:equipment) }

    let(:payload) do
      {
        data: {
          id: equipment.id.to_s,
          type: 'equipment',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EquipmentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { equipment.reload.updated_at }
      # .and change { equipment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:equipment) { create(:equipment) }

    let(:instance) do
      EquipmentResource.find(id: equipment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Equipment.count }.by(-1)
    end
  end
end

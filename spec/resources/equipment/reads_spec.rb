require 'rails_helper'

RSpec.describe EquipmentResource, type: :resource do
  describe 'serialization' do
    let!(:equipment) { create(:equipment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(equipment.id)
      expect(data.jsonapi_type).to eq('equipment')
    end
  end

  describe 'filtering' do
    let!(:equipment1) { create(:equipment) }
    let!(:equipment2) { create(:equipment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: equipment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([equipment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:equipment1) { create(:equipment) }
      let!(:equipment2) { create(:equipment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            equipment1.id,
            equipment2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            equipment2.id,
            equipment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe WorkoutResource, type: :resource do
  describe 'serialization' do
    let!(:workout) { create(:workout) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(workout.id)
      expect(data.jsonapi_type).to eq('workouts')
    end
  end

  describe 'filtering' do
    let!(:workout1) { create(:workout) }
    let!(:workout2) { create(:workout) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: workout2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([workout2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:workout1) { create(:workout) }
      let!(:workout2) { create(:workout) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            workout1.id,
            workout2.id
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
            workout2.id,
            workout1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    describe 'equipment' do
      let!(:workout) { create(:workout) }
      let!(:exercise) do
        create :exercise,
          workouts: [workout],
          equipment: [equipment]
      end
      let!(:equipment) { create(:equipment) }

      before do
        params[:include] = 'equipment'
      end

      it 'works' do
        render
        sl = d[0].sideload(:equipment)
        expect(sl.map(&:id)).to eq([equipment.id])
        expect(sl.map(&:jsonapi_type)).to eq(['equipment'])
      end
    end
  end
end

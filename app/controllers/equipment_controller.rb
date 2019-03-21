class EquipmentController < ApplicationController
  def index
    equipment = EquipmentResource.all(params)
    respond_with(equipment)
  end

  def show
    equipment = EquipmentResource.find(params)
    respond_with(equipment)
  end

  def create
    equipment = EquipmentResource.build(params)

    if equipment.save
      render jsonapi: equipment, status: 201
    else
      render jsonapi_errors: equipment
    end
  end

  def update
    equipment = EquipmentResource.find(params)

    if equipment.update_attributes
      render jsonapi: equipment
    else
      render jsonapi_errors: equipment
    end
  end

  def destroy
    equipment = EquipmentResource.find(params)

    if equipment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: equipment
    end
  end
end

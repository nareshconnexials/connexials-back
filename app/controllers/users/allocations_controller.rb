class Users::AllocationsController < ApplicationController

  def index
    @allocations = Allocation.all
    
    render json: @allocations
  end

  def create
    @allocations = Allocation.create! allocation_params
    if @allocations.persisted?
      render json: { message: "Allocation created successfully", data: @allocations }, status: :created and return
    end
    render json: { message: "Allocation could not be created successfully", errors: @allocations.errors.full_messages }, status: :unprocessable_entity
  
  end

  def show
    @allocations = Allocation.find_by_id!(params[:id])
    
    render json: @allocations
  end

  private

  def allocation_params
    params.require(:allocation).permit(:leave_id, :month, :credit, :leave, :penalty, :compoff)
  end
end
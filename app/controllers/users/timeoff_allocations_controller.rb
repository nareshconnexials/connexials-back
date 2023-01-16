class Users::TimeoffAllocationsController < ApplicationController

    skip_before_action :authenticate_user!
    
    def index
      @allocation = TimeoffAllocation.where(timeoff_id: params[:timeoff_id])
      
      render json: @timeoff_allocation
    end
  
    def create
        @allocation = TimeoffAllocation.create! allocation_params
      if @allocation.persisted?
        render json: { message: "Timeoff Allocation created successfully", data: @allocation}, status: :created and return
      end
  
      render json: { message: "Timeoff Allocations could not be created successfully", errors: @allocation.errors.full_messages }, status: :unprocessable_entity
  
    end
  
    def show
        @allocation = TimeoffAllocation.find_by_id!(params[:id])
      
      render json: @allocation
    end
  
    private
  
    def allocation_params
    #   params.require(:timeoff_allocation).permit(:timeoff_id, :month, :credit, :leave, :penalty, :compoff)
      params.fetch(:timeoff_allocation, {}).permit(:timeoff_id, :month, :credit, :leave, :penalty,
    :compoff)
    end
  end
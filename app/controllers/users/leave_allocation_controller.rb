class Users::LeaveAllocationController < ApplicationController

  def index
    @leaveallocation = LeaveAllocation.all
    
    render json: @leaveallocation
  end

  # def create
  #   @leaveallocation = LeaveAllocation.create! leaveallocation_params
  #   if @leaveallocation.persisted?
  #     render json: { message: "Leaveallocation created successfully", data: @leaveallocation }, status: :created and return
  #   end
  #   render json: { message: "Leaveallocation could not be created successfully", errors: @leaveallocation.errors.full_messages }, status: :unprocessable_entity
  
  # end 

  # def leaveallocation_params
  #   params.require(:leaveallocation).permit(:month, :credit, :leave, :loss, :penalty, :compoff)
  # end

end
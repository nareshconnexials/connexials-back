class Users::LeavesController < ApplicationController

  def create
    @leave = Leave.create! leave_params
    if @leave.persisted?
      render json: { message: "Leave created successfully", data: @leave }, status: :created and return
    end
    render json: { message: "Leave could not be created successfully", errors: @leave.errors.full_messages }, status: :unprocessable_entity
  
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date, :end_date, :leave_type)
  end
end
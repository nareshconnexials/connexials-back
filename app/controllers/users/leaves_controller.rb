class Users::LeavesController < ApplicationController

  def index
    @leave = Leave.all
    
    render json: @leave
  end

  def create
    @leave = Leave.create! leave_params
    if @leave.persisted?
      render json: { message: "Leave created successfully", data: @leave }, status: :created and return
    end
    render json: { message: "Leave could not be created successfully", errors: @leave.errors.full_messages }, status: :unprocessable_entity
  
  end

  def show
    @leave = Leave.find_by_id!(params[:id])
    
    render json: @leave
  end

  private

  def leave_params
    params.require(:leave).permit(:user_id, :from_date, :to_date, :from_session, :to_session, :days, :mail_to, :reason)
  end
end
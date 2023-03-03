class Users::LeavesController < ApplicationController 
    skip_before_action :authenticate_user!
  
    before_action :set_leave, only: [:show, :update] 
  
    def index 
      @leaves  = Leave.all 
      render json: @leaves.to_json
    end
  
    def show 
      render json: @leave
    end
  
    def create 
      @leave = Leave.create(leave_params)
      if @leave.persisted? 
        render json: {message: "leave created successfully", data: @leave}, status: :created and return 
      else  
        render json: {message: "leave is not created", errors: @leave.errors.messages}, status: :unprocessable_entity 
      end
    end 
  
    def update 
      if @leave.update(leave_params)
        render json: {message: "leave updated successfully", data: @leave}, status: :ok 
      else
        render json: {message: "leave is not updated", errors: @leave.errors.messages}, status: :ok 
      end
    end
  
    private 
  
    def set_leave
      @leave = Leave.find_by(id: params[:id])
      unless  @leave 
        render json: {error: 'Leave not found'}, status: :not_found 
      end
    end
  
    def leave_params
      params.require(:leaves).permit(:from_date, :to_date, :session_start, :session_end, :notes, :leave_type, :status)
    end
  
  end
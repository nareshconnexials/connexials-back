class Users::TimeoffsController < ApplicationController

  #skip_before_action :authenticate_user!
  
  before_action :set_timeoffs, only: [:show, :update] 

  def index 
    @timeoffs  = Timeoff.all 
    render json: @timeoffs.to_json
  end

  def show 
    render json: @timeoffs
  end

  def create 
    @timeoffs = Timeoff.new(timeoff_params)
    @timeoffs.user_id = current_user.id
    if @timeoffs.save 
      render json: {message: "timeoff created successfully", data: @timeoffs}, status: :created and return 
    else  
      render json: {message: "timeoff is not created", errors: @timeoffs.errors.messages}, status: :unprocessable_entity 
    end
  end 

  def update 
    if @timeoffs.update(timeoff_params)
      render json: {message: "timeoff updated successfully", data: @timeoffs}, status: :ok 
    else
      render json: {message: "timeoff is not updated", errors: @timeoffs.errors.messages}, status: :ok 
    end
  end

  private 

  def set_timeoffs
    @timeoffs = Timeoff.find_by(id: params[:id], user_id: current_user.id)
    unless  @timeoffs 
      render json: {error: 'timeoff not found'}, status: :not_found 
    end
  end

  def timeoff_params
    params.require(:timeoffs).permit(:from_date, :to_date, :session_start, :session_end, :notes, :leave_type, :status)
  end
end
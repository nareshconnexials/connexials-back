class Users::TimeoffsController < ApplicationController

  skip_before_action :authenticate_user!
  
  def index
    @timeoff = Timeoff.where(user_id: params[:user_id])
    
    render json: @timeoff
  end

  def create
    @timeoff = Timeoff.create! timeoff_params
    if @timeoff.persisted?
      render json: { message: "Timeoff created successfully", data: @timeoff}, status: :created and return
    end

    render json: { message: "Timeoff could not be created successfully", errors: @timeoff.errors.full_messages }, status: :unprocessable_entity

  end

  def show
    @timeoff= Timeoff.find_by_id!(params[:id])
    
    render json: @timeoff
  end

  private

  def timeoff_params
    params.require(:timeoff).permit(:user_id, :from_date, :to_date, :from_session, :to_session, :days, :mail_to, :reason)
  end
end
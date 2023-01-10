class Users::HolidaysController < ApplicationController

    def index
      @holiday = Holiday.where(user_id: params[:user_id])
      
      render json: @holiday
    end
  
    def create
      @holiday = Holiday.create! holiday_params
      if @holiday.persisted?
        render json: { message: "holiday created successfully", data: @holiday }, status: :created and return
      end
      render json: { message: "holiday could not be created successfully", errors: @holiday.errors.full_messages }, status: :unprocessable_entity
    
    end
  
    def show
      @holiday = Holiday.find_by_id!(params[:id])
      
      render json: @holiday
    end
  
    private
  
    def holiday_params
      params.require(:holiday).permit(:user_id, :from_date, :to_date, :from_session, :to_session, :days, :mail_to, :reason)
    end
end
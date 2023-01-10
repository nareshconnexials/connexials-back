class PayslipsController < ApplicationController

  def create
    @payslip = Payslip.create! payslip_params
    if @payslip.persisted?
      render json: { message: "Payslip created successfully", data: @payslip }, status: :created and return
    end
    render json: { message: "Payslip could not be created successfully", errors: @payslip.errors.full_messages }, status: :unprocessable_entity
  
  end

  def index
    @payslip = Payslip.all
    render json: @payslip
  end

  def new
    @payslips = Payslip.new
    @user = User.find(params[:user_id])
    if params[:date] and Payslip.find_by_user_id(params[:user_id]).present?
      @old_salary_date = Payslip.find_by_user_id(params[:user_id]).salary_date
      @a = @old_salary_date.strftime("%b%Y")
      @new_salary_date = params[:date].to_date
      @b = @new_salary_date.strftime("%b%Y")
      if @a == @b
        respond_to do |format|
          format.js
        end
      else
        render nothing: true
      end
    end
  end

  def show
    @payslip = Payslip.find_by_id!(params[:id])
    
    render json: @payslip
  end

  def payslip_params
    params.require(:payslip).permit(:employment_id, :from_date, :to_date, :month)
  end

end


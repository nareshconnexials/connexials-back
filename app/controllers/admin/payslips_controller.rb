module Admin
  class PayslipsController < Admin::ApplicationController

  def index
    @payslip = Payslip.all
    render json: @payslip
  end

  def show
    @payslip = Payslip.find(params[:id]).payslip_details
    render json: @payslip
  end

  end
end

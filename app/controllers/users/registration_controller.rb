class Users::RegistrationController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.create! user_params
    if @user.persisted?
      render json: { message: "Account created successfully", data: @user }, status: :created and return
    end
    render json: { message: "user could not be created successfully", errors: @user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:signup).permit(:first_name, :last_name, :email, :password)
  end
end
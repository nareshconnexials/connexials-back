class Users::ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @user = User.find_by_id!(params[:id])
    
    render json: @user
  end
end

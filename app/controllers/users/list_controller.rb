class Users::ListController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @user = User.all
    
    render json: @user
  end
end
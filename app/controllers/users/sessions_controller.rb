class Users::SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by!(email: session_params.fetch(:email))
    unless @user.authenticate(session_params.fetch(:password))
      render json: {msg: 'email/password is wrong'}, status: :ok and return
    end
    
    render json: {msg: 'success',user_id: @user.id, role: @user.role, token: encode({user_id: @user.id, email: @user.email, first_name: @user.first_name})}
  end

  private

  def session_params
    params.require(:signin).permit(:username, :email, :password)
  end
end
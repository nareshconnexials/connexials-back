class ApplicationController < ActionController::Base
  include Authenticable

  before_action :authenticate_user!

  protect_from_forgery with: :null_session,
  if: Proc.new { |c| c.request.format =~ %r{application/json} }


  def authenticate_user!
    header = request.headers["Authorization"]
    token = header.split(' ')&.last if header
    data = decode(token)
    set_current_user(data[:user_id])
    unless current_user
      render json: {message: "unauthorized request"}, status: :unauthorized
    end
  end

end

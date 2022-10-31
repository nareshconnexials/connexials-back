class ApplicationController < ActionController::API
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :render_unauthorize
  rescue_from ActiveRecord::RecordNotUnique, with: :render_record_not_unique

  before_action :authenticate_user!

  private

  def authenticate_user!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
    Rails.logger.debug ">>>>found token #{header}"
  end

  def render_unauthorize
    render json: {msg: 'unauthorized request', error: 'unauthoried request'}, status: 401
  end

  def render_record_not_unique
    render json: {msg: 'Record already exist', error: 'record not unique'}, status: 401
  end
end

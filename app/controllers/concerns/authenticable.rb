module Authenticable
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    data = HashWithIndifferentAccess.new decoded
  end

  def current_user
    @current_user
  end
  
  def set_current_user(user_id)
    return unless user_id
    @current_user ||= User.find_by(id: user_id)
  end

end
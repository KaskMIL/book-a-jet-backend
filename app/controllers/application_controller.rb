class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'Resource not found!' }, status: :not_found
  end

  rescue_from ActionController::RoutingError do
    render json: { error: 'bad route' }, status: :not_found
  end

  def secret_key
    Rails.application.secrets.secret_key_base
  end

  def token
    request.headers['Authorization'].split[1]
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  def decoded_token
    JWT.decode(token, secret_key)[0]
  rescue JWT::ExpiredSignature
    render json: { error: 'Token expired!' }, status: :unauthorized
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { error: 'Verification of token failed!' }, status: :unauthorized
  end

  def current_user
    @current_user ||= User.find_by(id: decoded_token['user_id'])
  end

  def logged_in?
    current_user.present?
  end
end

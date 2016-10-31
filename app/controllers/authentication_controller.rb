class AuthenticationController < ApplicationController
  def register
    user = User.create!(email: params[:email], password: params[:password])
    if user.present? && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: {errors: [e.message]}, status: :conflict
  rescue => e
    render json: {errors: [e.message]}, status: :unauthorized
  end

  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user.present? && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end

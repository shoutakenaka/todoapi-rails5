require 'securerandom'

class SessionsController < ApplicationController
  def create
    user = User.find_by!(username: params[:username])
    if !user.authenticate(params[:password])
      return render json: { code: 'not_authenticated' }, status: 401
    end
    token = SecureRandom.base64(64)
    user.sessions.create!(token: token)
    render json: { token: token }
  end
end

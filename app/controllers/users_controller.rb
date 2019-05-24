class UsersController < ApplicationController
  def create
    User.create!(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password])
    render json: {}
  end
end

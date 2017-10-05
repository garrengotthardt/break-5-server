class Api::V1::AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]

  def show
    render json: {
      id: current_user.id,
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      email: current_user.email,
      lat: current_user.lat,
      long: current_user.long,
      address: current_user.address,
      saved_places: current_user.user_places
    }
  end


  def create
    # see if there is a user with this username
    user = User.find_by(email: params[:email])
    # if the is, make sure that they have the correct password
    if user.present? && user.authenticate(params[:password])
      # if they do, render back a json response of the user info
      # issue token
      created_jwt = issue_token({id: user.id})
      render json: {email: user.email,jwt: created_jwt}
    else
      # otherwise, render back some error response
      render json: {
        error: 'Email or password incorrect'
      }, status: 422
    end
  end
end

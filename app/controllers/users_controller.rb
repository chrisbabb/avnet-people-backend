class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
        token = issue_token(user)
        render json: { valid: "true", user: {id: user.id, username: user.email, userlevel: user.userlevel}, token: token}
    else
        render json: { valid: "false", errorMessages: {login: "username or password is wrong"} }
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(legal_params)
      render json: user, status: :accepted
    else
      render json: { valid: "false", errorMessages: user.errors.messages }
    end

  end

  def destroy
    user = User.find(params[:id])

    user.destroy
  end

  private

  def legal_params
    params.permit(:email, :password, :userlevel)
  end

end
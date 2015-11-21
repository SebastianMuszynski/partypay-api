class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render_json(users)
  end

  def show
    render_json(@user)
  end

  def create
    user = User.new(user_params)
    if user.save
      render_json(user, :created)
    else
      render_error(user.errors)
    end
  end

  def update
    if @user.update(user_params)
      render_json(@user)
    else
      render_error(@user.errors)
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :email, :password, :password_confirmation)
  end
end

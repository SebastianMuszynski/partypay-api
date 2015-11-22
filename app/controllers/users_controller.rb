class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :topup]

  def login
    user = User.where(email: params[:email], password: params[:password]).first
    if user.present?
      render_json(user)
    else
      render_error("There is no user with provided data. Try again or sign up, please.")
    end
  end

  def signup
    create
  end

  def topup
    if @user.update(amount: @user.amount + params[:amount].to_f)
      render_json(@user)
    else
      render_error("Something went wrong :(")
    end
  end

  def index
    users = User.all
    render_json(users)
  end

  def show
    render_json(@user)
  end

  def get_by_email
    user = User.where(email: params[:email]).first
    if user
      render_json(user)
    else
      render_error("There is no user with given email.")
    end
  end

  def pay
    tag = Tag.where(name: params[:tag_name]).first
    if tag.present?
      user = tag.user

      if user.amount - params[:amount].to_f >= 0
        if user.update(amount: user.amount - params[:amount].to_f)
          render_json({ status: "accepted", message: "Payment accepted!" })
        else
          render_json({ status: "declined", message: "Network issue, try again please." })
        end
      else
        render_json({ status: "declined", message: "Declined: You don't have enough money on your account." })
      end
    else
      render_json({ status: "declined", message: "Declined: There is no tag with given ID." })
    end
  end

  private
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

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:id, :email, :password, :amount)
    end
end

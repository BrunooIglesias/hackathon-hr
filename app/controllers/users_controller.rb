class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  include Pundit

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show
    authorize @user
  end

  def create
    @user = User.create(user_params)
    authorize @user

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :role, :birth_date, :superior_id)
  end
end

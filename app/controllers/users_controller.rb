class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.all.order(created_at: :desc)
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true)
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User #{@user.email} was updated usccesfully"
    else
      render :edit
    end
  end

  def online?
    updated_at > 2.minutes.ago
  end
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit({role_ids:[]})
  end
end
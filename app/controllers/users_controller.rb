class UsersController < ApplicationController

  before_action :authenticate_user!
  def index
    @users = User.order(created_at: :asc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User role was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end
end

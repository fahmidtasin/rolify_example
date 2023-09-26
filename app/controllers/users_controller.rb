class UsersController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  # before_action :check_admin_role, only: [:index, :edit, :update]
  def index
    @users = User.order(created_at: :asc)
  end

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
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

  # def check_admin_role
  #   unless current_user.has_role?(:admin)
  #     redirect_to root_path, alert: "Unauthorized access. Only administrators can perform this action."
  #   end
  # end

end

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :login_required, only: [:index]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to root_url, notice: "新しいユーザーを作成しました"
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to root_url, notice: "ユーザー情報を更新しました"
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: "ユーザー「#{user.name}」を削除しました"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :admin)
  end
end

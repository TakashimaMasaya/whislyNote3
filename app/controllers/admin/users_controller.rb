class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to root_url, notice: "新しいユーザーを作成しました"
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to root_url, notice: "ユーザー情報を更新しました"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{user.name}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :admin)
  end

end

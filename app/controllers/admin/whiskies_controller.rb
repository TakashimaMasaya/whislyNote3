class Admin::WhiskiesController < ApplicationController
  before_action :if_not_admin
  before_action :set_whisky, only: [:destroy]

  layout 'admin_application.html.slim'
  def index
    @whiskies = Whisky.all
  end

  def new
    @whisky = Whisky.new
  end

  def destroy
    @whisky.destroy
    redirect_to whiskies_url, notice: "削除しました"
  end

  def create
    whisky = Whisky.new(whisky_params.merge(user_id: current_user.id))
    if whisky.save
      redirect_to admin_whiskies_url, notice: "新しいWhiskyを作成しました"
    else
      # render :newだとindexを参照してしまいエラーになる
      redirect_to action: :new #これだとリダイレクトだからerrorの情報が消える？
    end
  end

  private

  def whisky_params
    params.require(:whisky).permit(:name, :description, :image)
  end

  def set_whisky
    @whisky = Whisky.find(params[:id])
  end

end

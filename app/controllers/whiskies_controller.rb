class WhiskiesController < ApplicationController
  before_action :set_whisky, only: [:show, :edit, :update, :destroy]

  def index
    @whiskies = current_user.whiskies
  end

  def show
  end

  def new
    @whisky = Whisky.new
  end

  def edit
  end

  def create
    whisky = Whisky.new(whisky_params.merge(user_id: current_user.id))
    if whisky.save
      redirect_to whiskies_url, notice: "新しいWhiskyを作成しました"
    else
      # render :newだとindexを参照してしまいエラーになる
      redirect_to action: :new #これだとリダイレクトだからerrorの情報が消える？
    end
  end

  def update
    if @whisky.update(whisky_params)
      redirect_to whiskies_url, notice: "Whiskyの情報を更新しました"
    else
      # render :newだとindexを参照してしまいエラーになる
      redirect_to action: :show #これだとリダイレクトだからerrorの情報が消える？
    end
  end

  def destroy
    @whisky.destroy
    redirect_to whiskies_url, notice: "削除しました"
  end

  private

      # Only allow a list of trusted parameters through.
  def whisky_params
    params.require(:whisky).permit(:name, :description, :image)
  end

  def set_whisky
    @whisky = current_user.whiskies.find(params[:id])
  end

end

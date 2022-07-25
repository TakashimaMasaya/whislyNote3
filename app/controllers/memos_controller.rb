class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = current_user.memos
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def create
    memo = Memo.new(memo_params.merge(user_id: current_user.id))
    memo.save!
    redirect_to memos_url, notice: "新しいMemoを作成しました"
  end

  def update
    @memo.update!(memo_params)
    redirect_to memos_url, notice: "Memoの情報を更新しました"
  end

  def edit
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :description)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end


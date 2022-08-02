class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @user_blogs = current_user.blogs
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    blog = Blog.new(blog_params.merge(user_id: current_user.id))
    blog.save!
    redirect_to blogs_url, notice: "新しいblogを作成しました"
  end

  def update
    @blog.update!(blog_params)
    redirect_to blogs_url, notice: "blogの情報を更新しました"
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "削除しました"
  end

  private

      # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:description, :thumbnail)
  end

  def set_blog
    @blog = current_user.blogs.find(params[:id])
  end
end

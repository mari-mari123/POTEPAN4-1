class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :whole_day, :content))
    if @post.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash.keep[:failure] = "スケジュールを登録できませんでした"
      render "new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :whole_day, :content))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash.keep[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:delete] = "スケジュールを削除しました"
    redirect_to :posts
  end
end

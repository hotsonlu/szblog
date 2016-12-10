class BlogsController < ApplicationController

  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end
end

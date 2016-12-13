class BlogsController < ApplicationController

  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    # @post.visited
    # @comments = @post.comments.order(created_at: :desc)
    # respond_to do |format|
    #   format.html
    #  end

  end
end

class Admin::PostsController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find( params[:id] )
    render :new
  end

  def destroy
    @post = Post.find( params[:id] )
    if @post.destroy
      flash[:notice] = '删除博客成功'
      redirect_to admin_posts_path
    else
      flash[:error] = '删除博客失败'
      redirect_to admin_posts_path
    end
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end

  def create
     @post = Post.new(post_attrs)

    if @post.save
      flash[:notice] = '创建博客成功'
      redirect_to blogs_path
    else
      flash.now[:error] = '创建失败'
      render :new
    end
  end

  def update
    @post = Post.find( params[:id] )
    @post.attributes = post_attrs


    if @post.save

      flash[:notice] = '更新博客成功'
      redirect_to admin_posts_path
    else
      flash[:notice] = '更新博客失败'
      render :new
    end
  end

  private
  def post_attrs
    params.require(:post).permit(:title, :content)
  end



end

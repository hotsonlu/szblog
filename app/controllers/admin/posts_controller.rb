class Admin::PostsController < ApplicationController
  layout 'admin'
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

      init_tags

      flash[:notice] = '创建博客成功'
      redirect_to admin_posts_path
    else
      flash.now[:error] = '创建失败'
      render :new
    end
  end

  def update
    @post = Post.find( params[:id] )
    @post.attributes = post_attrs


    if @post.save
      @post.tags.destroy_all

      init_tags

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

  def init_tags
    params[:tags].split(',').each do |tag|
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new(title: tag) unless one_tag

      @post.tags << one_tag
    end
  end



end

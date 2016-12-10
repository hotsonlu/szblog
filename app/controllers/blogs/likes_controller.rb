class Blogs::likesController < ApplicationController
   before_action :set_blog

  def create
    @blog.likes.first_or_create

    respond_to do |format|
      format.html {redirect_to @blog}
      format.js
    end
  end

  def destroy
    @blog.likes.destroy_all

    respond_to do |format|
      format.html { redirect_to @blog}
      format.js
    end
  end

  private
    def set_blog
      @blog = Post.find(params[:blog_id])
    end
end

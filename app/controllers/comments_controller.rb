class CommentsController < ApplicationController
  layout false

  def create


    cookies[:name] = comment_params[:name]
    cookies[:email] = comment_params[:email]
    @post = Post.find(params[:blog_id])
    @comment = @post.comments.build(comment_params)


    if @comment.save
      @comments = @post.comments.order(created_at: :desc)
      flash[:notice] = 'you created a comment'

      respond_to do |format|
        format.html {redirect_to blog_path(@post)}
        format.js
      end
    end

   end

  private
  def comment_params
    params.require(:comment).permit(:content, :name, :email)
  end
end

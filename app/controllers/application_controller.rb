class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :format_time, :format_date

  helper_method :admin_username

  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(time)
    time.strftime("%Y.%m.%d")
  end

  before_action do
    @latst_posts = Post.order(created_at: 'desc').limit(8)
  end

  protected
  def authericate_user!
    if ! session[:login_info]
      flash[:error] = '请先登录后台管理'
      cookies[:urlback] = request.original_url
      redirect_to new_admin_session_path
    end
  end

  def admin_username
    session[:login_info] && ENV['ADMIN_USER']
  end
end

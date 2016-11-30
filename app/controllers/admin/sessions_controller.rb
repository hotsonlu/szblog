class Admin::SessionsController < ApplicationController
  # layout 'layouts/admin'

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      flash[:notice] = "Please put your username"
      render :new
    elsif ENV['ADMIN_USER'] != params[:username]
      flash[:notice] = "Wrong username"
      render :new
    elsif ENV['ADMIN_PASSWORD'] != params[:password]
      flash[:notice] = "Wrong password"
      render :new
    else
      flash[:notice] = "OK, You got it."
      session[:login] = true
      redirect_to root_path
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end

class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authericate_user!

  def index

  end
end

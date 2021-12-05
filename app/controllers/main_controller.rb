class MainController < ApplicationController
  before_action :redirect_to_dashboard_if_logged_in

  skip_before_action :redirect_to_dashboard_if_logged_in, only: [:map]

  def index;end
  def map;end
end

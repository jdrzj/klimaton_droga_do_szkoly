class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    if current_user.role == "student"
      redirect_to mapa_path
    end
  end

  def map;end

  def travel_started;end
  def travel_finished;end
  def rate_travel;end
  def rate_map;end

  def submit_rating
    Rating.create({lat: params["lat"], lng: params["lng"], description: params["rate"], user_id: current_user.id})
  end
end

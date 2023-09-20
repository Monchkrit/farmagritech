class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
    @enrollments = Enrollment.all
    @gardenrolls = @enrollments.where(:garden_id => params[:garden_id])
  end

  def create
    current_user.enrollments.create(garden: current_garden, user: current_user)
    redirect_to gardener_garden_path(current_garden)
  end

  private

  def current_garden
    @current_garden ||= Garden.find(params[:garden_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:garden_id, :user_id)
  end
end

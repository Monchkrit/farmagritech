class AccountingController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_garden

  def index
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
    @enrolls = Enrollment.where(:garden_id => params[:garden_id])
  end

  def show
    
  end

  private

  def require_authorized_for_current_garden
    @g = Garden.get_garden(current_user)
    if current_garden.id != @g.id
      puts current_garden.inspect
      render plain: "Unauthorized", status: :unauthorized
    end
  end
  
    helper_method :current_garden
    def current_garden
      @current_garden ||= Garden.find(params[:garden_id])
    end

  def accounting_params
    params.require(:accounting).permit(:garden_id)
  end
end

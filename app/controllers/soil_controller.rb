class SoilController < ApplicationController
  before_action :authenticate_user!
  
  def index   
    @soils = Soil.all
  end

  def import
    Soil.import(params[:file])
    redirect_to root_url, notice: "Soil was successfully imported!"
  end

  private

  def Soil_params
    params.require(:soil).permit(:om_r, :awc_r, :wsatiated_r, :ph1to1h2o_r, :cokey, :compname, :slope_r, :runoff, :tfact, :elev_r, :geomdesc, :ffd_r, :nirrcapcl, :nirrcapscl, :irrcapcl, :irrcapscl, :mukey, :musym, :muname)
  end
end

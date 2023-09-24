class SoilcubesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_cube

    def edit
    @time = Time.zone.now
    @cube = Soilcube.find_by_id(params[:id])
    @prism = Prism.find_by_id(@cube.prism_id)
    @garden = Garden.find_by_id(@cube.garden_id)
    @cubes = Soilcube.where(:prism_id => @cube)
    @plant = Planttype.where(:comname => @cube.crop_name)
    return render_not_found if @cube.blank?
  end

  def update
    @current_cube.update(cube_params)
    @time = Time.zone.now
    @prism = Prism.find_by_id(params[:prism_id])
    @cube = Soilcube.find_by_id(params[:id])
    @garden = Garden.find_by_id(@cube.garden_id)
    redirect_to garden_path(@garden)
  end

  private

  def require_authorized_for_current_cube
    @g = Garden.get_garden(current_user)
    if current_cube.garden_id != @g.id
      puts current_cube.inspect
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_cube
  def current_cube
    @current_cube ||= Soilcube.find(params[:id])
  end


  def cube_params
    params.require(:soilcube).permit(:prism_id, :crop_name, :garden_id, :row_num, :col_num, :irr_time, :crop_name, :seedcount, :sow_time, :planttype_id)
  end

end

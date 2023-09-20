class PrismsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_prism, only: [:new, :create]

  def index
    @garden = Garden.find_by_id(params[:garden_id])
    @prisms = Prism.where(:garden_id => @garden)
    @cubes = Soilcube.where(:prism_id => @prism)
    @rows = Row.where(:garden_id => @garden)
    @soil = Soil.where(:id => @garden)
    @time = Time.zone.now
  end

  def new
    @prism = Prism.new
  end

  def edit
    @prism = Prism.find_by_id(params[:id])
    @garden = Garden.find_by_id(@prism.garden_id)
    @time = Time.zone.now
  end

  def create
    
  end

  def update
    @prism = Prism.find(params[:id])
    @garden = Garden.find_by_id(@prism.garden_id)
    @nOfCubes = params[:nOfCubes]
    if @nOfCubes == ''
      @nOfCubes = 4    
    end
    @cubes = Soilcube.pickCubes(@prism.id, @nOfCubes)    
    @cubes.each do |p|
      p.crop_name = params[:crop_name]
      p.seedcount = params[:seedcount]
      p.sow_time = params[:sow_time]
      p.planttype_id = params[:planttype_id]
      p.save!
    end
    redirect_to garden_path(@prism.garden_id)
  end

  private  


  def prism_params
    params.require(:prism).permit(:garden_id, :row_num, :col_num, :numOfCubes, soilcubes_attributes: [:id, :crop_name, :seedcount, :sow_time, :row_num, :col_num, :planttype_id])
  end

  def require_authorized_for_current_prism
    @g = Garden.get_garden(current_user)
    if current_prism.garden_id != @g.id
      puts current_prism.inspect
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_prism
  def current_prism
    @current_prism ||= Prism.find(params[:id])
  end
end

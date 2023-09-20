class RowsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_row, only: [:new, :create]
  
  def new
    @row = Row.new
  end

  def worktable
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:id])
    @rows = Garden.get_rows(@garden)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    
  end

  def irrigate
    @row = Row.find_by_id(params[:id])
    @garden = Garden.get_garden(current_user)
    @row.irrigate(@row.id)
    redirect_to worktable_path(:garden_id => @garden.id)
  end

  def cultivate
    @row = Row.find_by_id(params[:id])
    @garden = Garden.get_garden(current_user)
    @row.cultivate(@row.id)
    redirect_to worktable_path(:garden_id => @garden.id)
  end

  def feed
    @row = Row.find_by_id(params[:id])
    @garden = Garden.get_garden(current_user)
    @row.feed(@row.id)
    redirect_to worktable_path(:garden_id => @garden.id)
  end

  def weed
    @row = Row.find_by_id(params[:id])
    @garden = Garden.get_garden(current_user)
    @row.weed(@row.id)
    redirect_to worktable_path(:garden_id => @garden.id)
  end

  def harvest
    @row = Row.find_by_id(params[:id])
    @garden = Garden.get_garden(current_user)
    @row.harvest(@row.id)
    redirect_to worktable_path(:garden_id => @garden.id)
  end

  def edit    
    @row = Row.find_by_id(params[:id])
    @garden = Garden.find_by_id(@row.garden_id)
    @prisms = Prism.where(:row_id => @row)
    @cubes = Soilcube.where(:row_id => @row.id)
    @time = Time.zone.now
  end

  def update
    @row = Row.find(params[:id])
    @prisms = Prism.where(:row_id => @row)
    @garden = Garden.find_by_id(@row.garden_id)
    @nOfCubes = params[:numOfCubes]
    if @nOfCubes == ''
      @nOfCubes = 4    
    end
    @prisms.each do |p|
    @cubes = Soilcube.pickCubes(p, @nOfCubes)
      @cubes.each do |c|
        c.crop_name = params[:crop_name]
        c.seedcount = params[:seedcount]
        c.sow_time = params[:sow_time]
        c.planttype_id = params[:planttype_id]
        c.save!
      end
    end
    redirect_to garden_path(@garden)
  end

  private

  def require_authorized_for_current_row
    @g = Garden.get_garden(current_user)
    if current_row.garden_id != @g.id
      puts current_row.inspect
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_row
  def current_row
    @current_row ||= Row.find(params[:id])
  end

  def row_params
    params.require(:row).permit(:garden_id, :row_num, :seedcount, :numOfCubes, :soilcube_id, :crop_name, :seedcount, :sow_time, :planttype_id)
  end
end

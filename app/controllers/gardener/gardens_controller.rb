class Gardener::GardensController < ApplicationController

  def index
    @time = Time.new
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find_by_id(params[:id])
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    @crops = Soilcube.distinct.where(:id => @garden).pluck(:crop_name)
    @rows = Garden.get_rows(@garden)
    @soil = Soil.distinct.where(:musym => @garden.musym)
    @time = Time.new
    
      return render_not_found if @garden.blank?
  end

  def gardentable
    @garden = Garden.find_by_id(params[:id])
    @cubes = Garden.get_cubes(@garden)
    @crops = Soilcube.distinct.where(:garden_id => @garden).pluck(:crop_name)
    @phz = Phmuszipcode.distinct.where(:zipcode => @garden.zipcode).limit 1
    @soil = Garden.get_soil(@garden.musym)
    @time = Time.new
      return render_not_found if @garden.blank?
  end

  def growtable
    @garden = Garden.find_by_id(params[:id])
    @crops = Soilcube.distinct.where(:garden_id => @garden).pluck(:crop_name)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden).order(:id)
    @rows = Garden.get_rows(@garden)
    @soil = Soil.distinct.where(:musym => @garden.musym)
    @time = Time.new
      return render_not_found if @garden.blank?
  end

  private
  
  def garden_params
    params.require(:garden).permit(:title, :description, :user_id)
  end
end

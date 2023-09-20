class GardensController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_garden
  skip_before_action :require_authorized_for_current_garden, only: [:new, :create, :irrigate, :cultivate]

  def new
  @time = Time.zone.now
    if Garden.exists?(:user_id => current_user)
      @garden = Garden.where(:user_id => current_user).first
      redirect_to garden_path(@garden)
    else
      @garden = Garden.new
    end
  end

  def create
    @garden = current_user.gardens.create(garden_params)
    if @garden.valid?
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @garden = Garden.find_by_id(params[:id])
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    @crops = Soilcube.distinct.where(:id => @garden).pluck(:crop_name)
    @rows = Garden.get_rows(@garden)
    @soil = Soil.distinct.where(:musym => @garden.musym)
    @time = Time.zone.now
    
      return render_not_found if @garden.blank?
  end

  def edit
    @garden = Garden.find_by_id(params[:id])
    @row = Prism.where(:row_id => params[:row_id])
    @time = Time.zone.now
    return render_not_found if @garden.blank?
  end

  def update
    @garden = Garden.find_by_id(params[:id])
    @time = Time.zone.now
    if @garden.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @garden.update_attributes(garden_params)
    if @garden.valid?
      redirect_to gardentable_path(:id => @garden)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @garden = Garden.find(params[:id])
    if @garden.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
  end
  @garden.destroy
  redirect_to new_garden_path
end

  def gardentable
    @garden = Garden.find_by_id(params[:id])
    @cubes = Garden.get_cubes(@garden)
    @crops = Soilcube.distinct.where(:garden_id => @garden).pluck(:crop_name)
    @phz = Phmuszipcode.distinct.where(:zipcode => @garden.zipcode).limit 1
    @soil = Garden.get_soil(@garden.musym)
    @time = Time.zone.now
      return render_not_found if @garden.blank?
  end

  def growtable
    @garden = Garden.find_by_id(params[:id])
    @crops = Soilcube.distinct.where(:garden_id => @garden).pluck(:crop_name)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Soilcube.where(:garden_id => @garden).order(:id)
    @rows = Garden.get_rows(@garden)
    @soil = Soil.distinct.where(:musym => @garden.musym)
    @time = Time.zone.now
      return render_not_found if @garden.blank?
  end

  def worktable
    @garden = Garden.find_by_id(params[:id])
    @rows = Garden.get_rows(@garden)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    @time = Time.zone.now
  end

  def irrigate
    @garden = Garden.find_by_id(params[:id])
    @garden.irrigate(@garden.id)
    redirect_to worktable_path(:garden_id => @garden.id)
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
    @current_garden ||= Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:street, :city, :state, :zipcode, :length, :width, :picture, :musym, :gardtype, :description, :title)
  end
end



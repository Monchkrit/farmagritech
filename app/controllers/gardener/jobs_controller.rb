class Gardener::JobsController < ApplicationController
  
  def index
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:id])
    @rows = Garden.get_rows(@garden)
    @prisms = Garden.get_prisms(@garden)
    @cultjobs = Job.where(:name => "Cultivate", :status => false, :garden_id => @garden)
    @feedjobs = Job.where(:name => "Feed", :status => false, :garden_id => @garden)
    @plantjobs = Job.where(:name => "Seed/Plant", :status => false, :garden_id => @garden)
    @weedjobs = Job.where(:name => "Weed", :status => false, :garden_id => @garden)
    @waterjobs = Job.where(:name => "Water", :status => false, :garden_id => @garden)
    @harvestjobs = Job.where(:name => "Harvest", :status => false, :garden_id => @garden)
  end

  def new
    @job = Job.new
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
  end

  def create
    @job = current_user.jobs.create(job_params)
    redirect_to gardener_jobs_worktable_path(:id => @job.garden_id)
  end

  def schedule
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
    @gardener = User.find_by_id(params[:gardener])
    @enrolled = Enrollment.where(:user_id => params[:gardener])
    @jobs = Job.where(:gardener => current_user)
  end

  def worktable
    @garden = Garden.find_by_id(params[:id])
    @rows = Garden.get_rows(@garden)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    @soil = Soil.distinct.where(:musym => @garden.musym)
    @time = Time.new
  end

  private
  
  helper_method :current_garden
  def current_garden
    @current_garden ||= Garden.find(params[:garden_id])
  end

  def job_params
    params.require(:job).permit(:garden_id, :name, :start_time, :finish_time, :user_id, :gardener_id, :farmer_id, :status, :verified)
  end
end

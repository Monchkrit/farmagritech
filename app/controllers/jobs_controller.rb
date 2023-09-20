class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_garden
  skip_before_action :require_authorized_for_current_garden, only: [:new, :create, :update]

  def new
    @job = Job.new
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
    @enrollments = Enrollment.where(:garden_id => @garden)
    
  end

  def create
    @garden = Garden.find_by_id(params[:garden_id])
    @job = current_user.jobs.create(job_params)
    redirect_to worktable_path(:garden_id => @job.garden_id)
  end

  def index
    @time = Time.zone.now
    @garden = Garden.find_by_id(params[:garden_id])
    @jobs = Job.where(:garden_id => params[:garden_id]).order(start_time: :asc)
    @cultjobs = Job.where(:name => "Cultivate", :status => false, :garden_id => @garden).order(start_time: :asc)
    @feedjobs = Job.where(:name => "Feed", :status => false, :garden_id => @garden).order(start_time: :asc)
    @plantjobs = Job.where(:name => "Seed/Plant", :status => false, :garden_id => @garden).order(start_time: :asc)
    @weedjobs = Job.where(:name => "Weed", :status => false, :garden_id => @garden).order(start_time: :asc)
    @waterjobs = Job.where(:name => "Water", :status => false, :garden_id => @garden).order(start_time: :asc)
    @harvestjobs = Job.where(:name => "Harvest", :status => false, :garden_id => @garden).order(start_time: :asc)
    
  end

  def update
    @garden = Garden.find_by_id(params[:garden_id])
    @job = Job.find_by_id(params[:id])
    @job.update_attributes(job_params)
    if @job.status == true
    @listitem = Accounting.new
    @listitem.list_job(@job.garden_id, @job.id, @job.start_time, @job.finish_time, @job.farmer_id, @job.gardener_id)
    end
      redirect_to worktable_path(:garden_id => @job.garden_id)
  end

  def destroy
    @job = Job.find(params[:id])
    @garden = Garden.find_by_id(params[:garden_id])
    if @job.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @job.destroy
    redirect_to jobs_path(:garden_id => @garden)
  end

  def worktable
    @garden = Garden.find_by_id(params[:garden_id])
    @rows = Garden.get_rows(@garden)
    @prisms = Garden.get_prisms(@garden)
    @cubes = Garden.get_cubes(@garden)
    @time = Time.zone.now
  end

  private

  def require_authorized_for_current_garden
    if current_garden.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end
  
  helper_method :current_garden
  def current_garden
    @current_garden ||= Garden.find(params[:garden_id])
  end

  def job_params
    params.require(:job).permit(:garden_id, :user_id, :gardener_id, :farmer_id, :name, :start_time, :finish_time, :user_id, :gardener, :status, :verified)
  end
end

class PlanttypesController < ApplicationController
  before_action :authenticate_user!
  def index
    @planttypes = Planttype.all
  end

  def import
    Planttype.import(params[:file])
    redirect_to root_url, notice: "Planttype Data Imported!"
  end
end

class PhmuszipcodesController < ApplicationController
  before_action :authenticate_user!
  def index
    @phmuszipcodes = Phmuszipcode.all
  end

  def import
    Phmuszipcode.import(params[:file])
    redirect_to root_url, notice: "Activity Data imported!"
  end


  private

  def phmuszipcode_params
    params.require(:phmuszipcode).permit(:zipcode, :zone, :trange, :zonetitle)
  end
end

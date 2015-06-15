class OceansController < ApplicationController

  def index
    @oceans = Ocean.all 
  end

  def new
  end

  def create
    Ocean.create ocean_params #See below. Whitelisted paramaters from '/new' form
    redirect_to oceans_path
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    @ocean = Ocean.find params[:id]
    @ocean.update ocean_params
    redirect_to ocean_path
  end

  def destroy
    @ocean = Ocean.find params[:id]
    @ocean.destroy
    redirect_to oceans_path
  end

  private   
  def ocean_params
    params.require(:ocean).permit(:name, :image, :hemisphere, :volume, :maximum_depth, :deepest_point) 
  end

end
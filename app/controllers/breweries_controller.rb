class BreweriesController < ApplicationController

  def index
    @breweries = Manufacturer.all
  end

  def create
    @brewery = Manufacturer.create(params[:manufacturer])
    if @brewery.persisted?
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end

  def new
    @brewery = Manufacturer.new
  end

end

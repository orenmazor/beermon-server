class KegsController < ApplicationController
  respond_to :json, :only => [:show, :update, :create]
  before_filter :find_beer, :only => [:create]
  before_filter :find_beer_tap, :only => [:show, :update]

  def show
    respond_with(@beer_tap.keg)
  end

  def update
    keg = @beer_tap.keg
    keg.update_attributes(params[:keg])
    respond_with(keg)
  end

  def create
    keg = request.format.json? ? @beer.kegs.create(params[:keg]) : nil
    respond_with(keg)
  end

  private
  def find_beer
    @beer = Beer.find(params[:beer_id])
  end

  def find_beer_tap
    @beer_tap = BeerTap.find(params[:tap_id])
  end

end

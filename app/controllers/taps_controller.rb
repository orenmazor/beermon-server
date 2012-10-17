class TapsController < ApplicationController
  respond_to :json, :only => [:index, :show, :update]
  before_filter :find_beer_tap, :only => [:show, :update]

  def index
    respond_with(BeerTap.all)
  end

  def show
    respond_with(@beer_tap)
  end

  def update
    keg = Keg.find(params[:keg_id])
    @beer_tap.keg = keg
    @beer_tap.save
    respond_with(@beer_tap)
  end

  private

  def find_beer_tap
    @beer_tap = BeerTap.find(params[:id])
  end

end

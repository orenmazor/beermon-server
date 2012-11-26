class KegsController < ApplicationController
  respond_to :json, :only => [:show, :update, :create]
  before_filter :find_beer, :only => [:create]
  before_filter :find_beer_tap, :only => [:show, :update]

  def index
    @beer_taps = BeerTap.all
    @kegs = Keg.untapped
  end

  def show
    respond_with(@beer_tap.keg)
  end

  def new
    @keg = Keg.new(:capacity => 20, :kind => 'sankey')
  end

  def update
    keg = @beer_tap.keg
    keg.update_attributes(params[:keg])
    respond_with(keg)
  end

  def create
    keg = @beer.kegs.create(params[:keg])
    respond_with([@beer, keg]) do |format|
      format.html { redirect_to :action => 'index' }
    end
  end

  private
  def find_beer
    beer_id = params[:beer_id] || params[:keg].delete(:beer_id)
    @beer = Beer.find(beer_id)
  end

  def find_beer_tap
    @beer_tap = BeerTap.find(params[:tap_id])
  end

end

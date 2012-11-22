class BeersController < ApplicationController
  respond_to :json, :only => [:index, :show, :create, :update, :destroy]
  respond_to :html
  before_filter :find_beer, :only => [:show, :update, :destroy]

  def index
    @beers = Beer.all
    respond_with(@beers)
  end

  def show
    respond_with(@beer)
  end

  def update
    @beer.update_attributes(params[:beer])
    respond_with(@beer)
  end

  def new
    @beer = Beer.new
  end

  def create
    beer = Beer.create(params[:beer])
    respond_with(beer)
  end

  def destroy
    @beer.destroy
    respond_with(@beer)
  end

  private

  def find_beer
    @beer = Beer.find(params[:id])
  end

end

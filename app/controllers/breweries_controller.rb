class BreweriesController < ApplicationController

  def index
    @breweries = Manufacturer.all
  end

  def create
  end

  def new
    @brewery = Manufacturer.new
  end

end

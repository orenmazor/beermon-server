class RatingsController < ApplicationController
  respond_to :html, :json, :only => [:create]
  before_filter :find_beer

  def new
    @rating = @beer.ratings.new
  end


  def create
    rating = request.format.json? ? @beer.ratings.create(params[:rating]) : nil
    respond_with(rating)
  end

  private

  def find_beer
    @beer = Beer.find(params[:beer_id])
  end
end

class RatingsController < ApplicationController
  respond_to :html, :json, :only => [:create]

  def create
    beer = Beer.find(params[:beer_id])
    rating = request.format.json? ? @beer.ratings.create(params[:rating]) : nil
    respond_with(rating)
  end
end

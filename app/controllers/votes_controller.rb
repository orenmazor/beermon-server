class VotesController < ApplicationController
  respond_to :json, :only => [:show, :update, :create]

  def vote
    beer = Beer.find_by_id(params[:beer_id])
    if beer.present?
      vote = Vote.find_or_initialize_by_beer_id_and_user_id(beer.id, current_user.id)
      vote.value = params[:value] || 0
      vote.save!
      flash[:notice] = "You just voted for #{beer.name}. Wootz!"
    else
      flash[:error] = "Beer #{params[:beer_id]} not found! We suggest you remedy this immediately."
    end
    redirect_to root_url
  end
end

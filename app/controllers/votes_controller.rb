class VotesController < ApplicationController
  respond_to :json, :only => [:show, :update, :create]

  def vote
    beer = Beer.find_by_id(params[:beer_id])
    if beer.present?
      vote = Vote.find_or_initialize_by_beer_id_and_user_id(beer.id, current_user.id)
      vote.value = normalize_vote(params[:value])
      vote.save!
      flash[:notice] = "You just voted for #{beer.name} with #{vote.value}. Wootz!"
    else
      flash[:error] = "Beer #{params[:beer_id]} not found! We suggest you remedy this immediately."
    end
    redirect_to root_url
  end

  private

  def normalize_vote(value)
    case
    when value > 0 then 1
    when value < 0 then -1
    else 0
    end
  end
end

class VotesController < ApplicationController
  respond_to :json, :only => [:show, :update, :create]

  def upvote
    vote_with(1)
  end

  def downvote
    vote_with(-1)
  end

  private

  def vote_with(value)
    beer = Beer.find_by_id(params[:beer_id])
    if beer.present?
      vote = Vote.find_or_initialize_by_beer_id_and_user_id(beer.id, current_user.id)
      vote.value = normalize_vote(value)
      vote.save!
      flash[:notice] = "You just #{vote.value > 0 ? 'upvoted' : 'downvoted'} #{beer.name}. Great success!"
    else
      flash[:error] = "Beer #{params[:beer_id]} not found! We suggest you remedy this immediately."
    end
    redirect_to root_url
  end

  def normalize_vote(value)
    case
    when value > 0 then 1
    when value < 0 then -1
    else 0
    end
  end

end

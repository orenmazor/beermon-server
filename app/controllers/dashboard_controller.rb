class DashboardController < ApplicationController
  skip_before_filter :authenticate
  before_filter :ensure_logged_in

  FORGET_FACTOR = 0.2

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
    puts "RECOMMENDED: #{recommend_a_beer.name}"
	end

  def call
    brewery = Manufacturer.find_by_id(params[:manufacturer_id])
    if brewery
      twilio = Twilio::REST::Client.new($twilio_username, $twilio_password)
      from = $twilio_sender
      to = current_user.phone_number

      url = Beermon::Application.application_url + "/callback?phone=#{brewery.phone}"

      flash[:message] = "Setting up a call with #{brewery.name}"

      if Rails.env.production?
        call = twilio.account.calls.create({:from => from, :to => to, :url => url})
      else
        flash[:message] << "You are in development fool! No real calls"
      end
    else
      flash[:error] = "That brewery doesn't exist???!?"
    end
    redirect_to root_url
  end

  private

  def ensure_logged_in
    unless current_user.present?
      redirect_to login_url
    end
  end

  def recommend_a_beer
    sorted = @beers.each.map { |beer| [beer, sort_value(beer)] }
    recommended_beer = sorted.sort_by { |beersort| beersort[1] }.last[0]
  end

  def sort_value(beer)
    # upvotes
    a   = beer.votes.where(:value => 1)
          .map { |v| Math.exp(-FORGET_FACTOR * (Date.today - v.updated_at.to_date).to_i) }
          .reduce(1, :+) * 1.0

    # downvotes
    b = beer.votes.where(:value => -1)
          .map { |v| Math.exp(-FORGET_FACTOR * (Date.today - v.updated_at.to_date).to_i) }
          .reduce(1, :+) * 1.0

    # mean and stddev
    m  = b / (b + a)
    sd = Math.sqrt(a * b / ((a + b) * (a + b) * (a + b + 1)))
    
    # sharpe ratio
    sr = sd / m
  end
end

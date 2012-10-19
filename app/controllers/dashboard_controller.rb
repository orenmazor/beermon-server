class DashboardController < ApplicationController
  skip_before_filter :authenticate
  before_filter :ensure_logged_in

  FORGET_FACTOR = 0.2

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
    recommend_a_beer
	end

  def call
    brewery = Manufacturer.find_by_id(params[:manufacturer_id])
    if brewery
      twilio = Twilio::REST::Client.new($twilio_username, $twilio_password)
      from = $twilio_sender
      to = current_user.phone_number
      url = Beermon::Application.application_url + "/callback?phone=#{brewery.phone}"

      flash[:message] = "Setting up a call to #{brewery.name}"

      Thread.new do
        twilio.client.calls.create({:from => from, :to => to, :url => url})
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

  def recommend_a_beer
    sorted = @beers.each.map { |beer| [beer, sort_value(beer)] }
    recommended_beer = sorted.sort_by { |beersort| beersort[1] }.last
  end

  def sort_value(beer)
    # upvotes
    puts "UPVOTES: #{beer.votes.where(:value => 1).inspect}"
    a   = beer.votes.where(:value => 1)
          .map { |v| Math.exp(-FORGET_FACTOR * (Date.today - v.updated_at.to_date).to_i) }
          .reduce(1, :+) * 1.0

    # downvotes
    puts "DOWNVOTES: #{beer.votes.where(:value => -1)}"
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

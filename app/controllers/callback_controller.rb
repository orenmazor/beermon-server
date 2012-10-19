class CallbackController < ApplicationController

  def index
    brewery = Brewery.find_by_phone(params[:phone])
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Connecting you to #{brewery.name}", :voice => 'woman'
      r.Dial :callerId => brewery.phone
    end

    render :text => response.text, :content_type => "text"
  end
end

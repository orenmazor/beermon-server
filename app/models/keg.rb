class Keg < ActiveRecord::Base
  DEFAULT_RATIO = 0.25
  has_many :measurements
  belongs_to :beer
  belongs_to :beer_tap
  attr_accessible :kind, :capacity, :beer, :notified
  after_update :send_capacity_warning, :if => :below_threshold?

  validates_presence_of :beer

  def remaining
    if measurements.present?
      capacity - (measurements.last.volume || 0)
    else
      capacity
    end
  end

  def ratio
    (remaining * 100 / capacity).to_i
  end

  def status
    if ratio < 25
      "danger"
    elsif ratio < 50
      "warning"
    else
      "success"
    end
  end

  def below_threshold?
    ratio = ENV['KEG_THRESHOLD'] ? ENV['KEG_WARNING_RATIO'].to_f : DEFAULT_RATIO
    threshold = capacity * ratio
    remaining < threshold
  end

  def serializable_hash(options = {})
    options[:include] = [:beer]
    options[:methods] = [:remaining]
    super
  end

  private

  def send_capacity_warning
    return unless beer && beer_tap
    return if notified?
    message = "Oh no! #{beer.name} on the #{beer_tap.name} tap is almost empty!"
    phone_numbers = User.where(:send_sms => true).map { |user| user.phone_number }
    twilio = Twilio::REST::Client.new($twilio_username, $twilio_password)
    from = $twilio_sender

    Thread.new do
      phone_numbers.each do |number|
        next unless number.present?
        twilio.account.sms.messages.create(
          :from => from,
          :to => number,
          :body => message
        )
      end
    end
    update_attributes(:notified => true)
  end
end

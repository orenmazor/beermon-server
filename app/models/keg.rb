class Keg < ActiveRecord::Base
  DEFAULT_RATIO = 0.25
  has_many :measurements
  belongs_to :beer
  belongs_to :beer_tap
  attr_accessible :kind, :capacity, :beer
  after_update :send_capacity_warning, :if => :below_threshold?

  validates_presence_of :beer

  def remaining
    capacity - measurements.sum(:volume)
  end

  def below_threshold?
    ratio = ENV['KEG_THRESHOLD'] ? ENV['KEG_WARNING_RATIO'].to_f : DEFAULT_RATIO
    threshold = capacity * ratio
    remaining < threshold
  end

  private

  def send_capacity_warning
  end
end

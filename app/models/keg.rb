class Keg < ActiveRecord::Base
  DEFAULT_RATIO = 0.25
  has_many :measurements
  attr_accessible :kind, :capacity, :brewery, :name
  after_update :send_capacity_warning, :if => :below_threshold?

  def remaining
    capacity - measurements.sum(:amount)
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

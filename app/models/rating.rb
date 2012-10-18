class Rating < ActiveRecord::Base
  belongs_to :beer
  validates_inclusion_of :value, :in => 1..5
  attr_accessible :value, :message
end

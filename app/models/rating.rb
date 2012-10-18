class Rating < ActiveRecord::Base
  belongs_to :beer
  validates_inclusion_of :rating, :in => 1..5
end

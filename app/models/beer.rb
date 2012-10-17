class Beer < ActiveRecord::Base
  attr_accessible :ibus, :srm, :abv, :name, :brewery
  has_many :kegs
  validates_presence_of :name, :brewery
end

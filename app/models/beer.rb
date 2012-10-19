class Beer < ActiveRecord::Base
  attr_accessible :ibus, :srm, :abv, :name, :brewery
  has_many :kegs
  has_many :ratings
  belongs_to :manufacturer
  validates_presence_of :name, :brewery

  def rating
    ratings.average(:value)
  end

  def serializable_hash(options={})
    options[:only] = [:id, :created_at, :updated_at, :name, :ibus, :srm, :abv, :brewery]
    options[:methods] = [:rating]
    super
  end

  def email_order
    email = "mailto:#{manufacturer.email}?"
    email << "subject="
    email << %w(Shopify would like to place an order for).join(' ')
    email << " #{name}"
    email
  end

end

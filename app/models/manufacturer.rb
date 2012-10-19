class Manufacturer < ActiveRecord::Base
  has_many :beers
  attr_accessible :name, :phone, :email, :address1, :address2, :city
  attr_accessible :city, :postal_code, :province, :country
  validate :valid_phone_number
  validates_presence_of :name

  def valid_phone_number
    return unless phone.present?
    return if phone =~ /\+\d{11}/
    errors.add(:phone, "must match format +10123456789")
  end
end

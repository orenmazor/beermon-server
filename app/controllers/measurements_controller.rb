class MeasurementsController < ApplicationController
  respond_to :json
  before_filter :find_keg

  def index
    respond_with(@keg.measurements)
  end

  def create
    measurement = @keg.measurements.create(params[:measurement])
    respond_with(measurement)
  end

  private

  def find_keg
    @keg = Keg.find(params[:id])
  end
end

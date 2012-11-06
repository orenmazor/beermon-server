require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase

  setup do
    @keg = kegs(:keg_o_lugtread)
    login
  end

  test "it should be possible to get a list of measurements for a keg" do
    get :index, :keg_id => @keg, :format => :json
    assert_response :ok
    measurements = ActiveSupport::JSON.decode(@response.body)
    assert_equal @keg.measurements.count, measurements.size
  end

  test "it should be possible to create a measurement for a keg" do
    request = {:volume => 0.5, :temperature => 9.5, :sampled_at => Time.now}
    assert_difference "Measurement.count" do
      post :create, :keg_id => @keg, :measurement => request, :format => :json
      assert_response :created
    end
  end

  test "it should be possible to create a measurement with only a temperature" do
    request = {:temperature => 8.0, :sampled_at => Time.now}
    assert_difference "Measurement.count" do
      post :create, :keg_id => @keg, :measurement => request, :format => :json
      assert_response :created
    end
  end

  test "it should be possible to create a measurement with only a volume" do
    request = {:volume => 8.0, :sampled_at => Time.now}
    assert_difference "Measurement.count" do
      post :create, :keg_id => @keg, :measurement => request, :format => :json
      assert_response :created
    end
  end

  test "it should not be possible to create a measurement with duplicate volumes for the same keg" do
    first_request = {:volume => 8.0, :sampled_at => 1.minute.ago}
    second_request = {:volume => 8.0, :sampled_at => Time.now}

    post :create, :keg_id => @keg, :measurement => first_request, :format => :json
    assert_response :created

    assert_no_difference "Measurement.count" do
      post :create, :keg_id => @keg, :measurement => second_request, :format => :json
      assert_response :unprocessable_entity
    end
  end
end
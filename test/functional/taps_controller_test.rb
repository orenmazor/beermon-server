require 'test_helper'

class TapsControllerTest < ActionController::TestCase

  setup do
    @keg = kegs(:keg_o_lugtread)
    @beer_tap = beer_taps(:right)
    login
  end

  test "it should be possible to request a list of taps" do
    get :index, :format => :json
    assert_response :ok
    taps = ActiveSupport::JSON.decode(@response.body)
    assert_equal BeerTap.count, taps.count
    expected_keys = %w{id keg_id name created_at updated_at}.sort
    assert_equal expected_keys, taps.first.keys.sort
  end

  test "it should be possible to view a taps information" do
    get :show, :id => @beer_tap, :format => :json
    assert_response :ok
  end

  test "it should be possible to swap out a keg on a tap" do
    put :update, :id => @beer_tap, :keg_id => @keg.id, :format => :json
    assert_response :no_content
    assert_equal @keg, @beer_tap.reload.keg
  end
end

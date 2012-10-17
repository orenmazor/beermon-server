require 'test_helper'

class KegsControllerTest < ActionController::TestCase
  setup do
    @beer_tap = beer_taps(:left)
    @beer = beers(:lugtread)
  end

  test "it should not be possible to create a new keg via HTML" do
    params = {kind: 'sankey', :capacity => 50.0}

    assert_no_difference "Keg.count" do
      post :create, :beer_id => @beer, :keg => params
    end
  end

  test "it should be possible to create a new keg of beer" do
    params = {kind: 'sankey', :capacity => 50.0}

    assert_difference "Keg.count" do
      post :create, :beer_id => @beer, :keg => params, :format => :json
      assert_response :created
    end
  end

  test "it should be possible to show the keg attached to a tap" do
    get :show, :tap_id => @beer_tap, :format => :json
    assert_response :ok
    keg = ActiveSupport::JSON.decode(@response.body)
    expected_keys = %w{id kind capacity created_at updated_at beer_tap_id beer_id}
    assert_equal expected_keys.sort, keg.keys
    assert_equal keg['id'], @beer_tap.keg.id
  end

  test "it should be possible to the details of a keg attached to a tap" do
    put :update, :tap_id => @beer_tap, :keg => {:kind => 'pin lock'}, :format => :json
    assert_response :no_content
    assert_equal 'pin lock', @beer_tap.keg.reload.kind
  end
end

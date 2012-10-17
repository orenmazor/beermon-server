require 'test_helper'

class BeersControllerTest < ActionController::TestCase

  test "it should only respond to JSON requests" do
    get :index
    assert_response :not_acceptable
  end

  test "it should return a list of beers on record" do
    get :index, :format => :json
    assert_response :ok

    results = ActiveSupport::JSON.decode(@response.body)
    expected_keys = %w{id created_at updated_at name brewery abv srm ibus}.sort
    assert_equal expected_keys, results.first.keys
  end

  test "it should be possible to create a new beer" do
    request = {
      name: 'Night Marzen',
      brewery: 'Beaus All Natural Brewing Co',
      ibus: 30.0,
      srm: 13.4,
      abv: 5.5
    }

    assert_difference "Beer.count" do
      post :create, :beer => request, :format => :json
      assert_response :created
    end
  end

  test "it should be possible to update a beer" do
    beer = beers(:lugtread)

    assert_no_difference "Beer.count" do
      put :update, :id => beer.id, :beer => {:brewery => "Moslon-Coors"}, :format => :json
      assert_response :no_content
    end

    assert_equal "Moslon-Coors", beer.reload.brewery
  end

  test "it should be possible to destroy a beer" do
    beer = beers(:lugtread)
    assert_difference "Beer.count", -1 do
      delete :destroy, :id => beer, :format => :json
      assert_response :no_content
    end
  end

end

require 'test_helper'

class TradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trade = trades(:one)
  end

  test "should get index" do
    get api_v1_trades_url, as: :json
    assert_response :success
  end

  test "should create trade" do
    assert_difference('Trade.count') do
      post api_v1_trades_url, params: {"amount":"1", "note":"test", "date_of_purchase":"3/1/2009", "currency":"bitcoin" }, as: :json
    end
    assert_response 200
  end


  test "should destroy trade" do
    assert_difference('Trade.count', -1) do
      delete api_v1_trade_path(@trade), as: :json
    end
    assert_response 204
  end
end

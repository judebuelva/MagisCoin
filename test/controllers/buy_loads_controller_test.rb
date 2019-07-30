require 'test_helper'

class BuyLoadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy_load = buy_loads(:one)
  end

  test "should get index" do
    get buy_loads_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_load_url
    assert_response :success
  end

  test "should create buy_load" do
    assert_difference('BuyLoad.count') do
      post buy_loads_url, params: { buy_load: { amount: @buy_load.amount, date_time: @buy_load.date_time, recv_id: @buy_load.recv_id, send_id: @buy_load.send_id } }
    end

    assert_redirected_to buy_load_url(BuyLoad.last)
  end

  test "should show buy_load" do
    get buy_load_url(@buy_load)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_load_url(@buy_load)
    assert_response :success
  end

  test "should update buy_load" do
    patch buy_load_url(@buy_load), params: { buy_load: { amount: @buy_load.amount, date_time: @buy_load.date_time, recv_id: @buy_load.recv_id, send_id: @buy_load.send_id } }
    assert_redirected_to buy_load_url(@buy_load)
  end

  test "should destroy buy_load" do
    assert_difference('BuyLoad.count', -1) do
      delete buy_load_url(@buy_load)
    end

    assert_redirected_to buy_loads_url
  end
end

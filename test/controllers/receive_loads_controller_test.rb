require 'test_helper'

class ReceiveLoadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive_load = receive_loads(:one)
  end

  test "should get index" do
    get receive_loads_url
    assert_response :success
  end

  test "should get new" do
    get new_receive_load_url
    assert_response :success
  end

  test "should create receive_load" do
    assert_difference('ReceiveLoad.count') do
      post receive_loads_url, params: { receive_load: { amount: @receive_load.amount, date_time: @receive_load.date_time, recv_id: @receive_load.recv_id, send_id: @receive_load.send_id } }
    end

    assert_redirected_to receive_load_url(ReceiveLoad.last)
  end

  test "should show receive_load" do
    get receive_load_url(@receive_load)
    assert_response :success
  end

  test "should get edit" do
    get edit_receive_load_url(@receive_load)
    assert_response :success
  end

  test "should update receive_load" do
    patch receive_load_url(@receive_load), params: { receive_load: { amount: @receive_load.amount, date_time: @receive_load.date_time, recv_id: @receive_load.recv_id, send_id: @receive_load.send_id } }
    assert_redirected_to receive_load_url(@receive_load)
  end

  test "should destroy receive_load" do
    assert_difference('ReceiveLoad.count', -1) do
      delete receive_load_url(@receive_load)
    end

    assert_redirected_to receive_loads_url
  end
end

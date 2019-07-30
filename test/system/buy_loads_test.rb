require "application_system_test_case"

class BuyLoadsTest < ApplicationSystemTestCase
  setup do
    @buy_load = buy_loads(:one)
  end

  test "visiting the index" do
    visit buy_loads_url
    assert_selector "h1", text: "Buy Loads"
  end

  test "creating a Buy load" do
    visit buy_loads_url
    click_on "New Buy Load"

    fill_in "Amount", with: @buy_load.amount
    fill_in "Date time", with: @buy_load.date_time
    fill_in "Recv", with: @buy_load.recv_id
    fill_in "Send", with: @buy_load.send_id
    click_on "Create Buy load"

    assert_text "Buy load was successfully created"
    click_on "Back"
  end

  test "updating a Buy load" do
    visit buy_loads_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @buy_load.amount
    fill_in "Date time", with: @buy_load.date_time
    fill_in "Recv", with: @buy_load.recv_id
    fill_in "Send", with: @buy_load.send_id
    click_on "Update Buy load"

    assert_text "Buy load was successfully updated"
    click_on "Back"
  end

  test "destroying a Buy load" do
    visit buy_loads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buy load was successfully destroyed"
  end
end
